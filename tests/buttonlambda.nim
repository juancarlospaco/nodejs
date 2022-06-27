import nodejs/karax
from std/sugar import `=>`

var lines: seq[cstring] = @[]

proc createDom(): VNode =
  result = buildHtml(tdiv):
    button(onclick = () => lines.add "Hello simulated universe"):
      text "Say hello!"
    for x in lines:
      tdiv:
        text x

setRenderer createDom
