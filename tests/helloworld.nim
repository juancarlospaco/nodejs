import nodejs/karax

proc createDom(): VNode =
  result = buildHtml(tdiv):
    text "Hello World!"

setRenderer createDom
