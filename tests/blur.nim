import vdom, karax, strutils

type TextInput* = ref object of VComponent
  value, guid: cstring
  isActive: bool
  onchange: proc (value: cstring)

proc render(x: VComponent): VNode =
  let self = TextInput(x)

  proc flip(ev: Event; n: VNode) =
    self.isActive = not self.isActive
    echo "flip! ", self.isActive, " id: ", self.debugId, " version ", self.version
    markDirty(self)

  proc onchanged(ev: Event; n: VNode) =
    if self.onchange != nil:
      self.onchange n.value
      self.value = n.value

  result = buildHtml(tdiv):
    input(value=self.value, onblur=flip, onfocus=flip, onkeyup=onchanged)

proc changed(current, next: VComponent): bool =
  let current = TextInput(current)
  let next = TextInput(next)
  if current.guid != next.guid:
    result = true
  else:
    result = defaultChangedImpl(current, next)

proc update(current, next: VComponent) =
  let current = TextInput(current)
  let next = TextInput(next)
  current.value = next.value
  current.guid = next.guid

when false:
  type
    Combined = ref object of VComponent
      a, b: TextInput

  proc renderComb(self: VComponent): VNode =
    let self = Combined(self)

    proc bu(ev: Event; n: VNode) =
      self.a.value = ""
      self.b.value = ""
      markDirty(self.a)
      markDirty(self.b)

    result = buildHtml(tdiv(style=self.style)):
      self.a
      self.b
      button(onclick=bu):
        text "reset"

  proc changed(self: VComponent): bool =
    let self = Combined(self)
    result = self.a.changedImpl(self.a) or self.b.changedImpl(self.b)


var
  persons: seq[cstring] = @[cstring"Karax", "Abathur", "Fenix"]
  selected = -1
  errmsg = cstring""

proc renderPerson(text: cstring, index: int): VNode =
  proc select(ev: Event, n: VNode) =
    selected = index
    errmsg = ""

  result = buildHtml():
    tdiv:
      text text
      button(onClick = select)

proc createDom(): VNode =
  result = buildHtml(tdiv):
    tdiv:
      for index, text in persons.pairs:
        renderPerson(text, index)
    tdiv:
      text errmsg

setRenderer createDom
