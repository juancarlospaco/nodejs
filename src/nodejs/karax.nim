## * Karax fork with custom bugfixes, cleanouts, SVG fixes, simplifications, etc built as dev work of NodeJS project.
import std/[dom, macros]
from std/strutils import startsWith, toLowerAscii
import vdom
export dom, vdom

{.experimental: "notNil".}
{.experimental: "strictFuncs".}
{.experimental: "strictEffects".}

type
  PatchKind = enum
    pkReplace, pkRemove, pkAppend, pkInsertBefore, pkDetach, pkSame
  Patch = object
    k: PatchKind
    parent, current:  Node
    newNode, oldNode: VNode
  PatchV = object
    parent, newChild: VNode
    pos:              int
  ComponentPair = object
    oldNode, newNode: VComponent
    parent, current:  Node
  RouterData* = ref object ## information that is passed to the 'renderer' callback
    hashPart*: cstring     ## the hash part of the URL for routing.
  KaraxInstance* = ref object ## underlying karax instance. Usually you don't have know about this.
    rootId:             cstring
    renderer:           proc (data: RouterData): VNode {.closure.}
    currentTree:        VNode
    postRenderCallback: proc (data: RouterData)
    toFocus:            Node
    toFocusV:           VNode
    rendering:          bool
    patches:            seq[Patch] # we reuse this to save allocations
    patchesV:           seq[PatchV]
    components:         seq[ComponentPair]
    surpressRedraws*:   bool
    byId:               JDict[cstring, VNode]
    orphans:            JDict[cstring, bool]
    renderId, patchLen, runCount, patchLenV: int

  EqResult = enum
    componentsIdentical, different, similar, identical, usenewNode

var kxi*: KaraxInstance ## The current Karax instance. This is always used as the default.
let KnownNS = {"svg":"http://www.w3.org/2000/svg", "math":"http://www.w3.org/1998/Math/MathML"}.toJDict()
var onhashChange {.importc: "window.onhashchange".}:  proc()
var hashPart     {.importc: "window.location.hash".}: cstring

proc setFocus*(n: VNode; enabled = true; kxi: KaraxInstance = kxi) = (if enabled: kxi.toFocusV = n)
template nativeValue(ev): cstring = cast[Element](ev.target).value
template setNativeValue(ev, val) = cast[Element](ev.target).value = val
proc karaxEvents(d: Node): JSeq[(cstring, NativeEventHandler)] {.importcpp: "#.karaxEvents".}
proc `karaxEvents=`(d: Node; value: JSeq[(cstring, NativeEventHandler)]) {.importcpp: "#.karaxEvents = #".}
template detach(n: VNode) = addPatch(kxi, pkDetach, nil, nil, nil, n)
proc getVNodeById*(id: cstring; kxi: KaraxInstance = kxi): VNode = (if kxi.byId.contains(id): result = kxi.byId[id])
proc reqFrame(callback: proc()): int {.importc: "window.requestAnimationFrame".}
proc setForeignNodeId*(id: cstring; kxi: KaraxInstance = kxi) = kxi.orphans[id] = true
proc avoidDomDiffing*(kxi: KaraxInstance = kxi) = kxi.currentTree = nil
func getInputText*(n: VNode):     cstring = (if n.dom != nil: result = n.dom.value)
func toChecked*(checked: bool):   cstring = (if checked:  cstring"checked"  else: cstring(nil))
func toDisabled*(disabled: bool): cstring = (if disabled: cstring"disabled" else: cstring(nil))
func toSelected*(selected: bool): cstring = (if selected: cstring"selected" else: cstring(nil))
template vnodeToDom*(n: VNode; kxi: KaraxInstance = nil): Node = toDom(n, useAttachedNode = false, kxi)
template prepend(parent, kid: Element) = parent.insertBefore(kid, parent.firstChild)

# ----------------- event wrapping ---------------------------------------


template keyeventBody() =
  let v = nativeValue(ev)
  n.value = v
  assert action != nil
  action(ev, n)
  if n.value != v: setNativeValue(ev, n.value)


proc addEventShell(d: Node; name: cstring; h: NativeEventHandler) =
  # The DOM is such a pathetic piece of junk that it doesn't
  # offer 'removeAllEventHandlers()'. Hence we store the event
  # handler twice in 'd' so that we can emulate this properly.
  # This is required to fix bug #139.
  d.addEventListener(name, h)
  if d.karaxEvents == nil:
    d.karaxEvents = newJSeq[(cstring, NativeEventHandler)]()
  d.karaxEvents.add((name, h))

proc removeAllEventHandlers(d: Node) =
  if d.karaxEvents != nil:
    for i in 0 ..< d.karaxEvents.len:
      d.removeEventListener(d.karaxEvents[i][0], d.karaxEvents[i][1])

proc wrapEvent(d: Node; n: VNode; k: EventKind; action: EventHandler): NativeEventHandler =
  proc stdWrapper(): NativeEventHandler =
    let action = action
    let n = n
    result = proc (ev: Event) =
      if n.kind == VNodeKind.textarea or n.kind == VNodeKind.input or n.kind == VNodeKind.select:
        keyeventBody()
      else: action(ev, n)

  proc enterWrapper(): NativeEventHandler =
    let action = action
    let n = n
    result = proc (ev: Event) =
      if cast[KeyboardEvent](ev).keyCode == 13: keyeventBody()

  proc laterWrapper(): NativeEventHandler =
    let action = action
    let n = n
    var timer: Timeout
    result = proc (ev: Event) =
      proc wrapper() = keyeventBody()
      if timer != nil: clearTimeout(timer)
      timer = setTimeout(wrapper, 400)

  case k
  of EventKind.onkeyuplater:
    result = laterWrapper()
    d.addEventShell("keyup", result)
  of EventKind.onkeyupenter:
    result = enterWrapper()
    d.addEventShell("keyup", result)
  else:
    result = stdWrapper()
    d.addEventShell(toEventName[k], result)

# --------------------- DOM diff -----------------------------------------


template attach(n: VNode) =
  n.dom = result
  if n.id != nil: kxi.byId[n.id] = n

proc applyEvents(n: VNode) =
  let dest = n.dom
  for i in 0 ..< len(n.events):
    n.events[i][2] = wrapEvent(dest, n, n.events[i][0], n.events[i][1])


proc toDom*(n: VNode; useAttachedNode: bool; kxi: KaraxInstance = nil; ns = ""): Node =
  var privNs = ns
  if useAttachedNode:
    if n.dom != nil:
      if n.id != nil: kxi.byId[n.id] = n
      return n.dom
  if n.kind == VNodeKind.text:
    result = document.createTextNode(n.text)
    attach n
  elif n.kind == VNodeKind.verbatim:
    result = document.createElement("div")
    result.innerHTML = n.text
    attach n
    return result
  elif n.kind == VNodeKind.vthunk:
    let x = callThunk(vcomponents[n.text], n)
    result = toDom(x, useAttachedNode, kxi)
    attach n
    return result
  elif n.kind == VNodeKind.dthunk:
    result = n.dom #callThunk(dcomponents[n.text], n)
    assert result != nil
    attach n
    return result
  else:
    let tag = toTag[n.kind] # upper case
    let tagName = $n.kind # lower case
    if ns.len > 0:
      result = document.createElementNS(ns.cstring, tagName.cstring)
    else:
      if tagName notin ["math", "svg"]:
        result = document.createElement(tag)
      else:
        privNs = KnownNS[tagName]
        result = document.createElementNS(privNs.cstring, tagName.cstring)
        result.setAttr("xmlns", cstring(privNs))
    attach n
    for k in n:
      appendChild(result, toDom(k, useAttachedNode, kxi, privNs))
    # text is mapped to 'value':
    if n.text != nil:
      result.value = n.text
  if n.id != nil:
    result.id = n.id
  if n.class != nil:
    result.class = n.class
  for k, v in attrs(n):
    if v != nil:
      result.setAttr(k, v)
  applyEvents(n)
  if kxi != nil and n == kxi.toFocusV and kxi.toFocus.isNil:
    kxi.toFocus = result

proc same(n: VNode, e: Node; nesting = 0): bool =
  if kxi.orphans.contains(n.id): return true
  if n.kind == VNodeKind.verbatim:
    result = true
  elif n.kind == VNodeKind.vthunk or n.kind == VNodeKind.dthunk:
    # we don't check these:
    result = true
  elif toTag[n.kind].toLowerCase == e.nodename.toLowerCase:
    result = true
    if n.kind != VNodeKind.text:
      # BUGFIX: Microsoft's Edge gives the textarea a child containing the text node!
      if e.len != n.len and n.kind != VNodeKind.textarea:
        return false
      for i in 0 ..< n.len:
        if not same(n[i], e[i], nesting+1): return false

proc replaceById(id: cstring; newTree: Node) =
  let x = document.getElementById(id)
  x.parentNode.replaceChild(newTree, x)
  newTree.id = id


proc eq(a, b: VNode; recursive: bool): EqResult =
  if a.kind != b.kind:   return different
  if a.id != b.id:       return different
  result = identical
  if a.index != b.index: return different
  if a.kind == VNodeKind.text:
    if a.text != b.text: return different # similar
  elif a.kind == VNodeKind.vthunk:
    if a.text != b.text: return different
    if a.len != b.len:   return different
    for i in 0 ..< a.len:
      if eq(a[i], b[i], recursive) == different: return different
  elif a.kind == VNodeKind.dthunk:
    if a.dom == b.dom:   return identical
    else:                return different
  elif a.kind == VNodeKind.verbatim:
    if a.text != b.text: return different
  if a.class != b.class or not sameAttrs(a, b): return similar

  if recursive:
    if a.len != b.len:   return different
    for i in 0 ..< a.len:
      if eq(a[i], b[i], true) != identical: return different
  return result

proc updateStyles(newNode, oldNode: VNode) =
  # we keep the oldNode, but take over the style from the new node:
  if oldNode.dom != nil: oldNode.dom.class = newNode.class
  oldNode.class = newNode.class

proc updateAttributes(newNode, oldNode: VNode) =
  # we keep the oldNode, but take over the attributes from the new node:
  if oldNode.dom != nil:
    for k, _ in attrs(oldNode): oldNode.dom.removeAttribute(k)
    for k, v in attrs(newNode):
      if v != nil: oldNode.dom.setAttr(k, v)
  takeOverAttr(newNode, oldNode)

proc mergeEvents(newNode, oldNode: VNode; kxi: KaraxInstance) =
  let d = oldNode.dom
  if d != nil: removeAllEventHandlers(d)
  shallowCopy(oldNode.events, newNode.events)
  applyEvents(oldNode)

proc addPatch(kxi: KaraxInstance; ka: PatchKind; parenta, currenta: Node; na, oldNode: VNode) =
  let L = kxi.patchLen
  if L >= kxi.patches.len: kxi.patches.add(Patch(k: ka, parent: parenta, current: currenta, newNode: na, oldNode: oldNode))
  else:
    kxi.patches[L].k = ka
    kxi.patches[L].parent = parenta
    kxi.patches[L].current = currenta
    kxi.patches[L].newNode = na
    kxi.patches[L].oldNode = oldNode
  inc kxi.patchLen

proc moveDom(dest, src: VNode) =
  dest.dom = src.dom
  src.dom = nil
  if dest.id != nil: kxi.byId[dest.id] = dest
  doAssert dest.len == src.len
  for i in 0 ..< dest.len: moveDom(dest[i], src[i])

proc applyPatch(kxi: KaraxInstance) =
  for i in 0 ..< kxi.patchLen:
    let p = kxi.patches[i]
    case p.k
    of pkReplace:
      let nn = toDom(p.newNode, useAttachedNode = true, kxi)
      if p.parent == nil: replaceById(kxi.rootId, nn)
      else:
        if p.current.parentNode == p.parent: p.parent.replaceChild(nn, p.current)
        else:                                p.parent.appendChild(nn)
    of pkSame:   moveDom(p.newNode, p.oldNode)
    of pkRemove: p.parent.removeChild(p.current)
    of pkAppend:
      let nn = toDom(p.newNode, useAttachedNode = true, kxi)
      p.parent.appendChild(nn)
    of pkInsertBefore:
      let nn = toDom(p.newNode, useAttachedNode = true, kxi)
      p.parent.insertBefore(nn, p.current)
    of pkDetach:
      let n = p.oldNode
      if n.id != nil: kxi.byId.del(n.id)
      # XXX for some reason this causes assertion errors otherwise:
      if not kxi.surpressRedraws: n.dom = nil
  kxi.patchLen = 0
  for i in 0 ..< kxi.patchLenV:
    let p = kxi.patchesV[i]
    p.parent[p.pos] = p.newChild
    doAssert p.newChild.dom != nil
  kxi.patchLenV = 0

proc diff(newNode, oldNode: VNode; parent, current: Node; kxi: KaraxInstance) =
  let result = eq(newNode, oldNode, false)
  case result
  of componentsIdentical:
    kxi.components.add ComponentPair(oldNode: VComponent(oldNode), newNode: VComponent(newNode), parent: parent, current: current)
  of identical, similar:
    newNode.dom = oldNode.dom
    if result == similar:
      updateStyles(newNode, oldNode)
      updateAttributes(newNode, oldNode)

      if oldNode.kind == VNodeKind.text:
        oldNode.text = newNode.text
        oldNode.dom.nodeValue = newNode.text

      # Set the value of the input field to update
      if oldNode.kind == VNodeKind.input:
        oldNode.dom.value = newNode.text

        let checked = newNode.getAttr("checked")
        oldNode.dom.checked = if checked.isNil: false else: true

    if newNode.events.len != 0 or oldNode.events.len != 0: mergeEvents(newNode, oldNode, kxi)

    let newLength = newNode.len
    let oldLength = oldNode.len
    if newLength == 0 and oldLength == 0: return
    let minLength = min(newLength, oldLength)

    doAssert oldNode.kind == newNode.kind
    var commonPrefix = 0

    # compute common prefix:
    while commonPrefix < minLength:
      if eq(newNode[commonPrefix], oldNode[commonPrefix], true) == identical:
        kxi.addPatch(pkSame, nil, nil, newNode[commonPrefix], oldNode[commonPrefix])
        inc commonPrefix
      else: break

    # compute common suffix:
    var oldPos = oldLength - 1
    var newPos = newLength - 1
    while oldPos >= commonPrefix and newPos >= commonPrefix:
      if eq(newNode[newPos], oldNode[oldPos], true) == identical:
        kxi.addPatch(pkSame, nil, nil, newNode[newPos], oldNode[oldPos])
        dec oldPos
        dec newPos
      else: break

    let pos = min(oldPos, newPos) + 1
    # now the different children are in commonPrefix .. pos - 1:
    for i in commonPrefix .. pos - 1: diff(newNode[i], oldNode[i], current, current.childNodes[i], kxi)

    if oldPos + 1 == oldLength:
      for i in pos .. newPos: kxi.addPatch(pkAppend, current, nil, newNode[i], nil)
    else:
      let before = current.childNodes[oldPos + 1]
      for i in pos .. newPos: kxi.addPatch(pkInsertBefore, current, before, newNode[i], nil)
    # XXX call 'attach' here?
    for i in pos .. oldPos:
      detach(oldNode[i])
      kxi.addPatch(pkRemove, current, current.childNodes[i], nil, nil)
  of different:
    detach(oldNode)
    kxi.addPatch(pkReplace, parent, current, newNode, nil)
  of usenewNode: doAssert(false, "eq returned usenewNode")

proc applyComponents(kxi: KaraxInstance) =
  # the first 'diff' pass detects components in the VDOM. The
  # 'applyComponents' expands components and so on until no
  # components are left to check.
  var i = 0
  # beware: 'diff' appends to kxi.components!
  # So this is actually a fixpoint iteration:
  while i < kxi.components.len:
    let x = kxi.components[i].oldNode
    let newNode = kxi.components[i].newNode
    if x.changedImpl != nil and x.changedImpl(x, newNode):
      let current = kxi.components[i].current
      let parent = kxi.components[i].parent
      x.updatedImpl(x, newNode)
      let oldExpanded = x.expanded
      x.expanded = x.renderImpl(x)
      x.renderedVersion = x.version
      if oldExpanded == nil:
        detach(x)
        kxi.addPatch(pkReplace, parent, current, x.expanded, nil)
      else: diff(x.expanded, oldExpanded, parent, current, kxi)
    inc i
  setLen(kxi.components, 0)

proc runDel*(kxi: KaraxInstance; parent: VNode; position: int) =
  detach(parent[position])
  let current = parent.dom
  kxi.addPatch(pkRemove, current, current.childNodes[position], nil, nil)
  parent.delete(position)
  applyPatch(kxi)
  doAssert same(kxi.currentTree, document.getElementById(kxi.rootId))

proc runIns*(kxi: KaraxInstance; parent, kid: VNode; position: int) =
  let current = parent.dom
  if position >= parent.len:
    kxi.addPatch(pkAppend, current, nil, kid, nil)
    parent.add(kid)
  else:
    let before = current.childNodes[position]
    kxi.addPatch(pkInsertBefore, current, before, kid, nil)
    parent.insert(kid, position)
  applyPatch(kxi)
  doAssert same(kxi.currentTree, document.getElementById(kxi.rootId))

proc runDiff*(kxi: KaraxInstance; oldNode, newNode: VNode) =
  let olddom = oldNode.dom
  doAssert olddom != nil
  diff(newNode, oldNode, nil, olddom, kxi)
  # this is a bit nasty: Since we cannot patch the 'parent' of
  # the current VNode (because we don't store it at all!), we
  # need to override the fields individually:
  takeOverFields(newNode, oldNode)
  applyComponents(kxi)
  applyPatch(kxi)
  if kxi.currentTree == oldNode: kxi.currentTree = newNode
  doAssert same(kxi.currentTree, document.getElementById(kxi.rootId))


proc dodraw(kxi: KaraxInstance) =
  if kxi.renderer.isNil: return
  kxi.renderId = 0

  if kxi.rendering:
    # there is a render already running, delay 1 frame
    kxi.renderId = reqFrame(proc () = kxi.dodraw)
    return

  kxi.rendering = true

  let rdata = RouterData(hashPart: hashPart)
  let newtree = kxi.renderer(rdata)
  inc kxi.runCount
  newtree.id = kxi.rootId
  kxi.toFocus = nil
  if kxi.currentTree == nil:
    let asdom = toDom(newtree, useAttachedNode = true, kxi)
    replaceById(kxi.rootId, asdom)
  else:
    doAssert same(kxi.currentTree, document.getElementById(kxi.rootId))
    let olddom = document.getElementById(kxi.rootId)
    diff(newtree, kxi.currentTree, nil, olddom, kxi)
  applyComponents(kxi)
  applyPatch(kxi)
  kxi.currentTree = newtree
  doAssert same(kxi.currentTree, document.getElementById(kxi.rootId))

  if not kxi.postRenderCallback.isNil: kxi.postRenderCallback(rdata)

  # now that it's part of the DOM, give it the focus:
  if kxi.toFocus != nil: kxi.toFocus.focus()
  kxi.rendering = false

proc redraw*(kxi: KaraxInstance = kxi) = (if kxi.renderId == 0: kxi.renderId = reqFrame(proc () = kxi.dodraw))
proc redrawSync*(kxi: KaraxInstance = kxi) = dodraw(kxi)
proc init(ev: Event) = kxi.renderId = reqFrame(proc () = kxi.dodraw)

proc setRenderer*(renderer: proc (data: RouterData): VNode, root: cstring = "ROOT", clientPostRenderCallback: proc (data: RouterData) = nil): KaraxInstance {.discardable.} =
  ## Setup Karax. Usually the return value can be ignored.
  if document.getElementById(root).isNil:
    let msg = "Could not find a <div> with id=" & root & ". Karax needs it as its rendering target."
    raise newException(Exception, $msg)
  result = KaraxInstance(rootId: root, renderer: renderer, postRenderCallback: clientPostRenderCallback, patches: newSeq[Patch](60), patchesV: newSeq[PatchV](30), components: @[], surpressRedraws: false, byId: newJDict[cstring, VNode](), orphans: newJDict[cstring, bool]())
  kxi = result
  window.onload = init
  onhashChange = proc() = redraw()

proc setRenderer*(renderer: proc (): VNode, root: cstring = "ROOT", clientPostRenderCallback: proc () = nil): KaraxInstance {.discardable.} =
  ## Setup Karax. Usually the return value can be ignored.
  proc wrapRenderer(data: RouterData): VNode = result = renderer()
  proc wrapPostRender(data: RouterData) = (if clientPostRenderCallback != nil: clientPostRenderCallback())
  setRenderer(wrapRenderer, root, wrapPostRender)

proc setInitializer*(renderer: proc (data: RouterData): VNode, root: cstring = "ROOT", clientPostRenderCallback: proc (data: RouterData) = nil): KaraxInstance {.discardable.} =
  ## Setup Karax. Usually the return value can be ignored.
  result = KaraxInstance(rootId: root, renderer: renderer, postRenderCallback: clientPostRenderCallback, patches: newSeq[Patch](60), patchesV: newSeq[PatchV](30), components: @[], surpressRedraws: true, byId: newJDict[cstring, VNode](), orphans: newJDict[cstring, bool]())
  kxi = result
  window.onload = init

proc addEventHandler*(n: VNode; k: EventKind; action: EventHandler;
                      kxi: KaraxInstance = kxi) =
  ## Implements the foundation of Karax's event management.
  ## Karax DSL transforms ``tag(onEvent = handler)`` to
  ## ``tempNode.addEventHandler(tagNode, EventKind.onEvent, wrapper)``
  ## where ``wrapper`` calls the passed ``action`` and then triggers
  ## a ``redraw``.
  proc wrapper(ev: Event; n: VNode) =
    action(ev, n)
    if not kxi.surpressRedraws: redraw(kxi)
  addEventListener(n, k, wrapper)

proc addEventHandler*(n: VNode; k: EventKind; action: proc();
                      kxi: KaraxInstance = kxi) =
  ## Implements the foundation of Karax's event management.
  ## Karax DSL transforms ``tag(onEvent = handler)`` to
  ## ``tempNode.addEventHandler(tagNode, EventKind.onEvent, wrapper)``
  ## where ``wrapper`` calls the passed ``action`` and then triggers
  ## a ``redraw``.
  proc wrapper(ev: Event; n: VNode) =
    action()
    if not kxi.surpressRedraws: redraw(kxi)
  addEventListener(n, k, wrapper)


{.push stackTrace:off.}
proc setupErrorHandler*() =
  ## Installs an error handler that transforms native JS unhandled exceptions into Nim based stack traces.
  proc stackTraceAsCstring(): cstring = cstring(getStackTrace())
  var onerror {.importc: "window.onerror", used.} =
    proc (msg, url: cstring, line, col: int, error: cstring): bool =
      var x = cstring"Error: " & msg & "\n" & stackTraceAsCstring()
      echo(x)
      return true
{.pop.}


proc loadScript*(jsfilename: cstring; kxi: KaraxInstance = kxi) =
  let s = document.createElement("script")
  s.setAttr "src", jsfilename
  document.body.prepend(s)
  redraw(kxi)

proc runLater*(action: proc(); later = 400): Timeout {.discardable.} =
  proc wrapper() =
    action()
    redraw()
  result = setTimeout(wrapper, later)

proc setInputText*(n: VNode; s: cstring) =
  ## Sets the text of input elements.
  n.text = s
  if n.dom != nil: n.dom.value = s


const
  StmtContext  = ["inc", "echo", "dec", "!"]
  SpecialAttrs = ["id", "class", "value", "index", "style"]

proc getName(n: NimNode): string =
  case n.kind
  of nnkIdent, nnkSym:                     result = $n
  of nnkAccQuoted:
    result = ""
    for i in 0 ..< n.len: result.add getName(n[i])
  of nnkStrLit..nnkTripleStrLit:           result = n.strVal
  of nnkDotExpr:                           result = getName(n[0]) & "." & getName(n[1])
  of nnkOpenSymChoice, nnkClosedSymChoice: result = getName(n[0])
  of nnkInfix:
    if n.len == 3 and $n[0] == "-": result = getName(n[1]) & "-" & getName(n[2]) else: expectKind(n, nnkIdent) # allow 'foo-bar'
  else: expectKind(n, nnkIdent)

proc tocstring(n: NimNode): NimNode =
  if n.kind == nnkStrLit: result = newCall(bindSym"cstring", n)
  else:
    result = copyNimNode(n)
    for child in n: result.add tocstring(child)

proc newDotAsgn(tmp: NimNode, key: string, x: NimNode): NimNode = newTree(nnkAsgn, newDotExpr(tmp, newIdentNode key), x)

proc tcall2(n, tmpContext: NimNode): NimNode =
  # we need to distinguish statement and expression contexts:
  # every call statement 's' needs to be transformed to 'dest.add s'.
  # If expressions need to be distinguished from if statements. Since
  # we know we start in a statement context, it's pretty simple to
  # figure out expression contexts: In calls everything is an expression
  # (except for the last child of the macros we consider here),
  # lets, consts, types can be considered as expressions
  # case is complex, calls are assumed to produce a value.
  template evHandler(): untyped = bindSym"addEventHandler"

  case n.kind
  of nnkLiterals, nnkIdent, nnkSym, nnkDotExpr, nnkBracketExpr:
    if tmpContext != nil: result = newCall(bindSym"add", tmpContext, n)
    else: result = n
  of nnkForStmt, nnkIfExpr, nnkElifExpr, nnkElseExpr, nnkOfBranch, nnkElifBranch, nnkExceptBranch, nnkElse, nnkConstDef, nnkWhileStmt, nnkIdentDefs, nnkVarTuple:
    # recurse for the last son:
    result = copyNimTree(n)
    let L = n.len
    doAssert n.len == result.len
    if L > 0: result[L - 1] = tcall2(result[L - 1], tmpContext)
  of nnkStmtList, nnkStmtListExpr, nnkWhenStmt, nnkIfStmt, nnkTryStmt, nnkFinally, nnkBlockStmt, nnkBlockExpr:
    # recurse for every child:
    result = copyNimNode(n)
    for x in n: result.add tcall2(x, tmpContext)
  of nnkCaseStmt:
    # recurse for children, but don't add call for case ident
    result = copyNimNode(n)
    result.add n[0]
    for i in 1 ..< n.len: result.add tcall2(n[i], tmpContext)
  of nnkProcDef:
    let name = getName n[0]
    if name.startsWith"on":
      # turn it into an anon proc:
      let anon = copyNimTree(n)
      anon[0] = newEmptyNode()
      if tmpContext == nil: error "no VNode to attach the event handler to"
      else: result = newCall(evHandler(), tmpContext, newDotExpr(bindSym"EventKind", n[0]), anon, ident"kxi")
    else: result = n
  of nnkVarSection, nnkLetSection, nnkConstSection: result = n
  of nnkCallKinds - {nnkInfix}:
    let op = getName(n[0])
    let ck = isComponent(op)
    if ck != ComponentKind.None:
      let tmp = genSym(nskLet, "tmp")
      let call = if ck == ComponentKind.Tag:     newCall(bindSym"tree", newDotExpr(bindSym"VNodeKind", n[0]))
                 elif ck == ComponentKind.VNode: newCall(bindSym"vthunk", newLit(op))
                 else:                           newCall(bindSym"dthunk", newLit(op))
      result = newTree(if tmpContext == nil: nnkStmtListExpr else: nnkStmtList, newLetStmt(tmp, call))
      for i in 1 ..< n.len:
        # named parameters are transformed into attributes or events:
        let x = n[i]
        if x.kind == nnkExprEqExpr:
          let key = getName x[0]
          if key.startsWith("on"): result.add newCall(evHandler(), tmp, newDotExpr(bindSym"EventKind", x[0]), x[1], ident("kxi"))
          elif eqIdent(key, "style") and x[1].kind == nnkTableConstr: result.add newDotAsgn(tmp, key, newCall("style", tocstring x[1]))
          elif key in SpecialAttrs:
            result.add newDotAsgn(tmp, key, x[1])
            if key == "value": result.add newCall(bindSym"setAttr", tmp, newLit(key), x[1])
          elif eqIdent(key, "setFocus"): result.add newCall(key, tmp, x[1], ident"kxi")
          elif eqIdent(key, "events"):   result.add newCall(bindSym"mergeEvents", tmp, x[1])
          else:                          result.add newCall(bindSym"setAttr", tmp, newLit(key), x[1])
        elif ck != ComponentKind.Tag: call.add x
        elif eqIdent(x, "setFocus"): result.add newCall(x, tmp, bindSym"true", ident"kxi")
        else:                        result.add tcall2(x, tmp)
      if tmpContext == nil:          result.add tmp
      else:                          result.add newCall(bindSym"add", tmpContext, tmp)
    elif tmpContext != nil and op notin StmtContext:
      var hasEventHandlers = false
      for i in 1 ..< n.len:
        let it = n[i]
        if it.kind in {nnkProcDef, nnkStmtList}:
          hasEventHandlers = true
          break
      if not hasEventHandlers: result = newCall(bindSym"add", tmpContext, n)
      else:
        let tmp = genSym(nskLet, "tmp")
        var slicedCall = newCall(n[0])
        let ex = newTree(nnkStmtListExpr)
        ex.add newEmptyNode() # will become the let statement
        for i in 1 ..< n.len:
          let it = n[i]
          if it.kind in {nnkProcDef, nnkStmtList}: ex.add tcall2(it, tmp)
          else:                                    slicedCall.add it
        ex[0] = newLetStmt(tmp, slicedCall)
        ex.add tmp
        result = newCall(bindSym"add", tmpContext, ex)
    elif op == "!" and n.len == 2: result = n[1]
    else:                          result = n
  else: result = n

macro buildHtml*(tag, children: untyped): VNode =
  let kids = newProc(procType=nnkDo, body=children)
  expectKind kids, nnkDo
  var call: NimNode
  if tag.kind in nnkCallKinds: call = tag
  else:                        call = newCall(tag)
  call.add body(kids)
  result = tcall2(call, nil)
  when defined(debug): echo repr(result)

macro buildHtml*(children: untyped): VNode =
  let kids = newProc(procType=nnkDo, body=children)
  expectKind kids, nnkDo
  result = tcall2(body(kids), nil)
  when defined(debug): echo repr(result)
