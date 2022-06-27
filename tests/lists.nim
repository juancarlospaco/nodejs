import std/strutils
import nodejs/karax

var contents: seq[cstring] = @[]

proc onTodoEnter(e: Event; n: VNode) =
  contents.insert(n.value & "BBBB")
  contents.insert(n.value)
  n.value = ""

proc createDom(): VNode =
  result = buildHtml(tdiv):
    input(class = "new-todo", placeholder="What needs to be done?", name = "newTodo",
          onkeyupenter = onTodoEnter, setFocus)
    for c in contents:
      tdiv:
        text c

setRenderer createDom
