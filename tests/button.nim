import nodejs/karax

var lines: seq[cstring] = @[]

proc createDom(): VNode =
  result = buildHtml(tdiv):
    button(title="hello", alt="OWO", placeHolder="UWU", class="A", id="B"):
      text "Say hello!"
      proc onclick(ev: Event; n: VNode) =
        lines.add "Hello simulated universe"
    for x in lines:
      tdiv:
        text x

setRenderer createDom
