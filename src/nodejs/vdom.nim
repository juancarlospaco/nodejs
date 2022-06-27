## Virtual DOM implementation for Karax.
import std/[dom, macros, tables, strutils]
export dom


type
  VNodeKind* {.pure.} = enum
    text = "#text", int = "#int", bool = "#bool", vthunk = "#vthunk", dthunk = "#dthunk", component = "#component", verbatim = "#verbatim", html, head, title, base, link, meta, style, script, noscript, body, section, nav, article, aside, h1, h2, h3, h4, h5, h6, hgroup,
    header, footer, address, main, p, hr, pre, blockquote, ol, ul, li, dl, dt, dd, figure, figcaption, tdiv = "div", a, em, strong, small, strikethrough = "s", cite, quote, dfn, abbr, data, time, code, `var` = "var", samp, kdb, sub, sup, italic = "i", bold = "b",
    underlined = "u", mark, ruby, rt, rp, bdi, dbo, span, br, wbr, ins, del, img, iframe, embed, `object` = "object", param, portal, video, audio, source, track, canvas, map, area, animate, animateMotion, animateTransform, circle, clipPath, defs, desc,
    `discard` = "discard", ellipse, feBlend, feColorMatrix, feComponentTransfer, feComposite, feConvolveMatrix, feDiffuseLighting, feDisplacementMap, feDistantLight, feDropShadow, feFlood, feFuncA, feFuncB, feFuncG, feFuncR, feGaussianBlur, feImage, feMerge,
    feMergeNode, feMorphology, feOffset, fePointLight, feSpecularLighting, feSpotLight, feTile, feTurbulence, filter, foreignObject, g, image, line, linearGradient, marker, mask, metadata, mpath, path, pattern, polygon, polyline, radialGradient, rect, `set` = "set", stop,
    svg, switch, symbol, stext = "text", textPath, tspan, unknown, use, view, svgtext = "text", maction, math, menclose, merror, mfenced, mfrac, mglyph, mi, mlabeledtr, mmultiscripts, mn, mo, mover, mpadded, mphantom, mroot, mrow, ms, mspace, msqrt, mstyle, msub, msubsup,
    msup, mtable, mtd, mtext, mtr, munder, munderover, semantics, table, caption, colgroup, col, tbody, thead, tfoot, tr, td, th, form, fieldset, legend, label, input, button, select, datalist, optgroup, option, textarea, keygen, output, progress, meter, details, summary, command, menu

  EventKind* {.pure.} = enum ## The events supported by the virtual DOM.
    onclick, oncontextmenu, ondblclick, onkeyup, onkeydown, onkeypressed, onfocus, onblur, onchange, onscroll, onmousedown, onmouseenter, onmouseleave, onmousemove, onmouseout, onmouseover, onmouseup, ondrag, ondragend, ondragenter,
    ondragleave, ondragover, ondragstart, ondrop, onsubmit, oninput, onanimationstart, onanimationend, onanimationiteration, onkeyupenter, onkeyuplater, onload, ontransitioncancel, ontransitionend, ontransitionrun, ontransitionstart, onwheel

  EventHandler*           = proc (ev: Event; target: VNode) {.closure.}
  NativeEventHandler*     = proc (ev: Event) {.closure.}
  EventHandlers*          = seq[(EventKind, EventHandler, NativeEventHandler)]
  VKey*                   = cstring
  JDict*[K, V]            = ref object
  JSeq*[T]                = ref object
  ComponentKind* {.pure.} = enum None, Tag, VNode

  VNode* = ref object of RootObj
    kind*:              VNodeKind
    index*:             int ## a generally useful 'index'
    id*, class*, text*: cstring
    kids:               seq[VNode]
    attrs:              seq[cstring]  # even index: key, odd index: value; done this way for memory efficiency
    events*:            EventHandlers
    dom*:               Node ## the attached real DOM node. Can be 'nil' if the virtual node is not part of the virtual DOM anymore.

  VComponent* = ref object of VNode ## The abstract class for every karax component.
    key*: VKey                      ## key that determines if two components are identical.
    renderImpl*:   proc(self: VComponent): VNode
    changedImpl*:  proc(self, newInstance: VComponent): bool
    updatedImpl*:  proc(self, newInstance: VComponent)
    onAttachImpl*: proc(self: VComponent)
    onDetachImpl*: proc(self: VComponent)
    expanded*:     VNode
    version*, renderedVersion*, debugId*: int

const selfClosing = {area, base, br, col, embed, hr, img, input, link, meta, param, source, track, wbr}

proc value*(n: VNode): cstring = n.text
proc `value=`*(n: VNode; v: cstring) = n.text = v
proc intValue*(n: VNode):     int = n.index
proc vn*(i: int):           VNode = VNode(kind: VNodeKind.int, index: i)
proc vn*(b: bool):          VNode = VNode(kind: VNodeKind.int, index: ord(b))
proc vn*(x: cstring):       VNode = VNode(kind: VNodeKind.text, index: -1, text: x)
proc text*(s: string):      VNode = VNode(kind: VNodeKind.text, text: cstring(s), index: -1)
proc text*(s: cstring):     VNode = VNode(kind: VNodeKind.text, text: s, index: -1)
proc verbatim*(s: string):  VNode = VNode(kind: VNodeKind.verbatim, text: cstring(s), index: -1)
proc verbatim*(s: cstring): VNode = VNode(kind: VNodeKind.verbatim, text: s, index: -1)
proc addEventListener*(n: VNode; event: EventKind; handler: EventHandler) = n.events.add((event, handler, nil))
proc len(a: cstring): int = (if a == nil: 0 else: a.len)
func setAttributeNS*(n: Node, ns, name, value: cstring) {.importcpp.}
func setAttrNs*(n: Node, ns, name, value: cstring) = n.setAttributeNS(ns, name, value)
template callThunk*(fn: typed; n: VNode): untyped = fn(n.kids)
proc vthunk*(name: cstring; args: varargs[VNode, vn]): VNode = VNode(kind: VNodeKind.vthunk, text: name, index: -1, kids: @args)
proc defaultChangedImpl*(v, newInstance: VComponent): bool = (v.key != newInstance.key or v.version != v.renderedVersion)
proc dthunk*(dom: Node): VNode = VNode(kind: VNodeKind.dthunk, dom: dom)
proc defaultUpdatedImpl*(v, newInstance: VComponent) = discard
template markDirty*(c: VComponent) = inc c.version
proc takeOverAttr*(newNode, oldNode: VNode) = shallowCopy(oldNode.attrs, newNode.attrs)
proc len*(x: VNode): int = x.kids.len
proc `[]`*(x: VNode; idx: int): VNode = x.kids[idx]
proc `[]=`*(x: VNode; idx: int; y: VNode) = x.kids[idx] = y
proc delete*(parent: VNode; position: int) = parent.kids.delete(position)
proc insert*(parent, kid: VNode; position: int) = parent.kids.insert(kid, position)
proc newVNode*(kind: VNodeKind): VNode = VNode(kind: kind, index: -1)
proc add*(parent, kid: VNode) = parent.kids.add(kid)
iterator items*(n: VNode): VNode = (for i in 0..<n.kids.len: yield n.kids[i])
iterator attrs*(n: VNode): (cstring, cstring) = (for i in countup(0, n.attrs.len-2, 2): yield (n.attrs[i], n.attrs[i + 1]))
func parseFloat*(s: cstring): BiggestFloat       {.importc, nodecl.}
func split*(s, sep: cstring): seq[cstring]       {.importcpp, nodecl.}
func strip*(s: cstring): cstring                 {.importcpp: "#.trim()", nodecl.}
func startsWith*(a, b: cstring): bool            {.importcpp: "startsWith", nodecl.}
func contains*(a, b: cstring): bool              {.importcpp: "(#.indexOf(#) >= 0)", nodecl.}
func containsIgnoreCase*(a, b: cstring): bool    {.importcpp: """(#.search(new RegExp(#.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$$\|]/g, "\\$$&") , "i")) >= 0)""", nodecl.}
func substr*(s: cstring; start: int): cstring    {.importcpp: "substr", nodecl.}
func `&`*(a, b: cstring): cstring                {.importcpp: "(# + #)", nodecl.}
func toCstr*(s: int): cstring                    {.importcpp: "((#) + '')", nodecl.}
func `&`*(s: int): cstring                       {.importcpp: "((#) + '')", nodecl.}
func `&`*(s: bool): cstring                      {.importcpp: "((#) + '')", nodecl.}
func `&`*(s: float): cstring                     {.importcpp: "((#) + '')", nodecl.}
func `&`*(s: cstring): cstring                   {.importcpp: "(#)", nodecl.}
func toLowerCase*(a:cstring):cstring             {.importcpp: "#.toLowerCase()", nodecl.}
func parseInt*(s: cstring): int                  {.importcpp: "parseInt(#, 10)", nodecl.}
func `[]`*[K, V](d: JDict[K, V], k: K): V        {.importcpp: "#[#]".}
func `[]=`*[K, V](d: JDict[K, V], k: K, v: V)    {.importcpp: "#[#] = #".}
func newJDict*[K, V](): JDict[K, V]              {.importcpp: "{@}".}
func contains*[K, V](d: JDict[K, V], k: K): bool {.importcpp: "#.hasOwnProperty(#)".}
func del*[K, V](d: JDict[K, V], k: K)            {.importcpp: "delete #[#]".}
func `[]`*[T](s: JSeq[T], i: int): T             {.importcpp: "#[#]".}
func `[]=`*[T](s: JSeq[T], i: int, v: T)         {.importcpp: "#[#] = #".}
func newJSeq*[T](len: int = 0): JSeq[T]          {.importcpp: "new Array(#)".}
func len*[T](s: JSeq[T]): int                    {.importcpp: "#.length".}
func add*[T](s: JSeq[T]; x: T)                   {.importcpp: "#.push(#)".}
func shrink*[T](s: JSeq[T]; shorterLen: int)     {.importcpp: "#.length = #".}
func split*(s, sep: cstring; max: int): seq[cstring] {.importcpp, nodecl.}
func substr*(s: cstring; start, length: int): cstring {.importcpp: "substr", nodecl.}
when not declared(dom.createElementNS):
  func createElementNS*(d: Document, namespaceURI, qualifiedIdentifier: cstring): Element {.importcpp.}
func isInt*(s: cstring): bool {.asmNoStackFrame.} =
  asm """return `s`.match(/^[0-9]+$/);"""


macro buildLookupTables(): untyped =
  var a = newTree(nnkBracket)
  for i in low(VNodeKind) .. high(VNodeKind):
    let x = $i
    let y = if x[0] == '#': x else: toUpperAscii(x)
    a.add(newCall("cstring", newLit(y)))
  var e = newTree(nnkBracket)
  for i in low(EventKind) .. high(EventKind): e.add(newCall("cstring", newLit(substr($i, 2))))
  template tmpl(a, e) {.dirty.} =
    const toTag*:       array[VNodeKind, cstring] = a
    const toEventName*: array[EventKind, cstring] = e
  result = getAst tmpl(a, e)

buildLookupTables()


proc setEventIfNoConflict(v: VNode; kind: EventKind; handler: EventHandler) =
  doAssert handler != nil
  for i in 0 ..< v.events.len:
    if v.events[i][0] == kind: return
  v.events.add((kind, handler, nil))

proc mergeEvents*(v: VNode; handlers: EventHandlers) =
  ## Overrides or adds the event handlers to `v`'s internal event handler list.
  for h in handlers: v.setEventIfNoConflict(h[0], h[1])

var gid = 0
proc getDebugId(): int =
  inc gid
  gid

proc setAttr*(n: VNode; key: cstring; val: cstring = "") =
  if n.attrs.len == 0:
    n.attrs = @[key, val]
  else:
    for i in countup(0, n.attrs.len - 2, 2):
      if n.attrs[i] == key:
        n.attrs[i + 1] = val
        return
    n.attrs.add key
    n.attrs.add val

proc getAttr*(n: VNode; key: cstring): cstring =
  for i in countup(0, n.attrs.len - 2, 2):
    if n.attrs[i] == key: return n.attrs[i + 1]

proc takeOverFields*(newNode, oldNode: VNode) =
  shallowCopy(oldNode.kind,   newNode.kind)
  shallowCopy(oldNode.index,  newNode.index)
  shallowCopy(oldNode.id,     newNode.id)
  shallowCopy(oldNode.class,  newNode.class)
  shallowCopy(oldNode.text,   newNode.text)
  shallowCopy(oldNode.kids,   newNode.kids)
  shallowCopy(oldNode.attrs,  newNode.attrs)
  shallowCopy(oldNode.events, newNode.events)
  shallowCopy(oldNode.dom,    newNode.dom)

proc tree*(kind: VNodeKind; kids: varargs[VNode]): VNode =
  result = newVNode(kind)
  for k in kids: result.add k

proc tree*(kind: VNodeKind; attrs: openArray[(cstring, cstring)]; kids: varargs[VNode]): VNode =
  result = tree(kind, kids)
  for a in attrs: result.setAttr(a[0], a[1])

proc sameAttrs*(a, b: VNode): bool =
  if a.attrs.len == b.attrs.len:
    result = true
    for i in 0 ..< a.attrs.len:
      if a.attrs[i] != b.attrs[i]: return false

proc toString*(n: VNode; result: var string; indent: int) =
  for i in 1 .. indent: result.add ' '
  if result.len > 0: result.add '\L'
  result.add "<" & $n.kind
  if n.id.len    > 0: result.add ' ' & astToStr(id) & " = " & $n.id
  if n.class.len > 0: result.add ' ' & astToStr(class) & " = " & $n.class
  for k, v in attrs(n): result.add " " & $k & " = " & $v
  result.add ">\L"
  if n.kind == VNodeKind.text:
    result.add n.text
  else:
    if n.text.len > 0:
      result.add " value = "
      result.add n.text
    for child in items(n):
      toString(child, result, indent + 2)
  for i in 1 .. indent: result.add ' '
  result.add "\L</" & $n.kind & ">"

proc add*(result: var string, n: VNode, indent = 0, indWidth = 2) =
  ## adds the textual representation of `n` to `result`.

  proc addEscapedAttr(result: var string, s: cstring) =
    # `addEscaped` alternative with less escaped characters.
    # Only to be used for escaping attribute values enclosed in double quotes!
    for c in items(s):
      case c
      of '<': result.add("&lt;")
      of '>': result.add("&gt;")
      of '&': result.add("&amp;")
      of '"': result.add("&quot;")
      else: result.add(c)

  proc addEscaped(result: var string, s: cstring) =
    ## same as ``result.add(escape(s))``, but more efficient.
    for c in items(s):
      case c
      of '<': result.add("&lt;")
      of '>': result.add("&gt;")
      of '&': result.add("&amp;")
      of '"': result.add("&quot;")
      of '\'': result.add("&#x27;")
      of '/': result.add("&#x2F;")
      else: result.add(c)

  proc addIndent(result: var string, indent: int) =
    result.add('\n')
    when not defined(danger):
      for i in 1 .. indent: result.add(' ')

  if n.kind == VNodeKind.text:
    result.addEscaped(n.text)
  elif n.kind == VNodeKind.verbatim:
    result.add(n.text)
  else:
    let kind = $n.kind
    result.add('<')
    result.add(kind)
    if n.id.len > 0:
      result.add " id=\""
      result.addEscapedAttr(n.id)
      result.add('"')
    if n.class.len > 0:
      result.add " class=\""
      result.addEscapedAttr(n.class)
      result.add('"')
    elif n.kind notin {
      VNodeKind.text, VNodeKind.int, VNodeKind.bool, VNodeKind.vthunk, VNodeKind.dthunk, VNodeKind.component, VNodeKind.verbatim, VNodeKind.html, VNodeKind.head, VNodeKind.title, VNodeKind.base, VNodeKind.link, VNodeKind.meta, VNodeKind.style, VNodeKind.script, VNodeKind.noscript,
      VNodeKind.p, VNodeKind.tdiv, VNodeKind.a, VNodeKind.em, VNodeKind.strong, VNodeKind.small, VNodeKind.strikethrough, VNodeKind.`var`, VNodeKind.underlined, VNodeKind.mark, VNodeKind.ruby, VNodeKind.rt, VNodeKind.rp, VNodeKind. bdi, VNodeKind.dbo, VNodeKind.span, VNodeKind.br,
      VNodeKind.wbr, VNodeKind.ins, VNodeKind.del, VNodeKind.`object`, VNodeKind.param, VNodeKind.animate, VNodeKind.animateMotion, VNodeKind.animateTransform, VNodeKind.circle, VNodeKind.clipPath, VNodeKind.defs, VNodeKind.desc, VNodeKind.`discard`, VNodeKind.ellipse, VNodeKind.feBlend,
      VNodeKind.feColorMatrix, VNodeKind.feComponentTransfer, VNodeKind.feComposite, VNodeKind.feConvolveMatrix, VNodeKind.feDiffuseLighting, VNodeKind.feDisplacementMap, VNodeKind.feDistantLight, VNodeKind.feDropShadow, VNodeKind.feFlood, VNodeKind.feFuncA, VNodeKind.feFuncB, VNodeKind.feFuncG,
      VNodeKind.feFuncR, VNodeKind.feGaussianBlur, VNodeKind.feImage, VNodeKind.feMerge, VNodeKind.feMergeNode, VNodeKind.feMorphology, VNodeKind.feOffset, VNodeKind.fePointLight, VNodeKind.feSpecularLighting, VNodeKind.feSpotLight, VNodeKind.feTile, VNodeKind.feTurbulence, VNodeKind.filter,
      VNodeKind.foreignObject, VNodeKind.g, VNodeKind.image, VNodeKind.line, VNodeKind.linearGradient, VNodeKind.marker, VNodeKind.mask, VNodeKind.metadata, VNodeKind.mpath, VNodeKind.path, VNodeKind.pattern, VNodeKind.polygon, VNodeKind.polyline, VNodeKind.radialGradient, VNodeKind.rect,
      VNodeKind.`set`, VNodeKind.stop, VNodeKind.switch, VNodeKind.symbol, VNodeKind.stext, VNodeKind.textPath, VNodeKind.tspan, VNodeKind.unknown, VNodeKind.use, VNodeKind.view, VNodeKind.svgtext, VNodeKind.maction, VNodeKind.math, VNodeKind.menclose, VNodeKind.merror, VNodeKind.mfenced,
      VNodeKind.mfrac, VNodeKind.mglyph, VNodeKind.mi, VNodeKind.mlabeledtr, VNodeKind.mmultiscripts, VNodeKind.mn, VNodeKind.mo, VNodeKind.mover, VNodeKind.mpadded, VNodeKind.mphantom, VNodeKind.mroot, VNodeKind.mrow, VNodeKind.ms, VNodeKind.mspace, VNodeKind.msqrt, VNodeKind.mstyle, VNodeKind.msub,
      VNodeKind.msubsup, VNodeKind.msup, VNodeKind.mtable, VNodeKind.mtd, VNodeKind.mtext, VNodeKind.mtr, VNodeKind.munder, VNodeKind.munderover, VNodeKind.semantics, VNodeKind.col, VNodeKind.tr, VNodeKind.td, VNodeKind.th, VNodeKind.keygen, VNodeKind.output, VNodeKind.command, VNodeKind.menu}:
      result.add " class=\""
      result.add(kind)
      case n.kind
      of VNodeKind.table:  result.add(" is-bordered is-striped is-hoverable")
      of VNodeKind.figure: result.add(" image")
      of VNodeKind.nav:    result.add(" navbar")
      else: discard
      result.add '"'
    for k, v in attrs(n):
      result.add(' ')
      result.add(k)
      result.add("=\"")
      result.addEscapedAttr(v)
      result.add('"')
    if n.len > 0:
      result.add('>')
      if n.len > 1:
        var noWhitespace = false
        for i in 0 ..< n.len:
          if n[i].kind == VNodeKind.text:
            noWhitespace = true
            break

        if noWhitespace:
          # for mixed leaves, we cannot output whitespace for readability. For example: ``a<b>b</b>`` is different from ``a <b>b</b>``.
          for i in 0 ..< n.len: result.add(n[i], indent + indWidth, indWidth)
        else:
          for i in 0 ..< n.len:
            result.addIndent(indent + indWidth)
            result.add(n[i], indent + indWidth, indWidth)
          result.addIndent(indent)
      else:
        result.add(n[0], indent + indWidth, indWidth)
      result.add("</")
      result.add(kind)
      result.add(">")
    elif n.kind in selfClosing:
      result.add(" />")
    else:
      result.add(">")
      result.add("</")
      result.add(kind)
      result.add(">")


proc `$`*(n: VNode): cstring =
    var res = ""
    toString(n, res, 0)
    result = cstring(res)

proc getVNodeById*(n: VNode; id: cstring): VNode =
  ## Get the VNode that was marked with ``id``. Returns ``nil`` if no node exists.
  if n.id == id: return n
  for i in 0 ..< n.len:
    result = getVNodeById(n[i], id)
    if result != nil: return result


func toJDict*[A, B](pairs: openArray[(A, B)]): JDict[A, B] =
  result = newJDict[A, B]()
  for key, val in items(pairs): result[key] = val

var
  vcomponents* = newJDict[cstring, proc(args: seq[VNode]): VNode]()
  allcomponents {.compileTime.} = initTable[string, ComponentKind]()

proc isComponent*(x: string): ComponentKind {.compileTime.} = allcomponents.getOrDefault(x)

proc addTags() {.compileTime.} =
  let x = (bindSym"VNodeKind").getTypeImpl
  expectKind(x, nnkEnumTy)
  for i in ord(VNodeKind.html) .. ord(VNodeKind.high):
    let tag = $x[i + 1]  # +1 because of empty node at the start of the enum AST:
    allcomponents[tag] = ComponentKind.Tag

static: addTags()

func unpack(symbolicType: NimNode; index: int): NimNode {.compileTime, used.} =
  let t = repr(symbolicType)
  case t
  of "cstring":
    result = quote do:
      args[`index`].text
  of "int", "VKey":
    result = quote do:
      args[`index`].intValue
  of "bool":
    result = quote do:
      args[`index`].intValue != 0
  elif t.endsWith"Kind":
    result = quote do:
      `symbolicType`(args[`index`].intValue)
  else:
    result = quote do:
      args[`index`]

func newName*(n: NimNode): NimNode =
  if n.kind == nnkPostfix:
    n[1] = newName(n[1])
    result = n
  elif n.kind == nnkSym: result = ident(n.strVal)
  else:                  result = n

macro compact*(prc: untyped): untyped =
  ## A 'compact' tree generation proc is one that only depends on its
  ## inputs and should be stored as a compact virtual DOM tree and
  ## only expanded on demand (when its inputs changed).
  var n = prc.copyNimNode
  for i in 0 .. 6: n.add prc[i].copyNimTree
  expectKind(n, nnkProcDef)
  if n[0].kind == nnkEmpty: error("please pass a non anonymous proc", n[0])
  let name = n[0]
  let params = params(n)
  let rettype = repr params[0]
  var isvirtual = ComponentKind.None
  if rettype == "VNode": isvirtual = ComponentKind.VNode
  else: error("component must return VNode", params[0])
  let realName = if name.kind == nnkPostfix: name[1] else: name
  let nn = $realName
  n[0] = ident("inner" & nn)
  var unpackCall = newCall(n[0])
  var counter = 0
  for i in 1 ..< params.len:
    let param = params[i]
    let L = param.len
    let typ = param[L - 2]
    for j in 0 .. L - 3:
      unpackCall.add unpack(typ, counter)
      inc counter

  template vwrapper(pname, unpackCall) {.dirty.} =
    proc pname(args: seq[VNode]): VNode = unpackCall

  template vregister(key, val) =
    bind `[]=`
    `[]=`(vcomponents, cstring(key), val)

  result = newTree(nnkStmtList, n)

  if isvirtual == ComponentKind.VNode:
    result.add getAst(vwrapper(newName name, unpackCall))
    result.add getAst(vregister(newLit(nn), realName))
  allcomponents[nn] = isvirtual
  when defined(debug): echo repr(result)
