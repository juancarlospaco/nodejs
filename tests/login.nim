import nodejs/karax

from std/sugar import `=>`

proc loginField(desc, field, class: cstring;
                validator: proc (field: cstring): proc ()): VNode =
  result = buildHtml(tdiv):
    label(`for` = field):
      text desc
    input(class = class, id = field, onchange = validator(field))

# some consts in order to prevent typos:
const
  username = cstring"username"
  password = cstring"password"

proc validateNotEmpty(field: cstring): proc () =
  result = proc () =
    let x = getVNodeById(field)
    if x.text == "":
      echo(field, field & " must not be empty")
    else:
      echo(field, "")

var loggedIn: bool

proc loginDialog(): VNode =
  result = buildHtml(tdiv):
    if not loggedIn:
      loginField("Name: ", username, "input", validateNotEmpty)
      loginField("Password: ", password, "password", validateNotEmpty)
    else:
      p:
        text "You are now logged in."

when not declared(toychat):
  setRenderer loginDialog
