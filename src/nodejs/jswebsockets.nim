from dom import Event, EventTarget
export Event

# TODO: finish MessageEvent
# TODO: check if there are missing fields
# TODO: tests


type
  StatusCode* = enum
    scNormal = 1000
    scGoingAway = 1001
    scProtocolError = 1002
    scUnsupported = 1003
    scReserved = 1004
    scNoStatus = 1005
    scAbnormal = 1006
    scUnsupportedData = 1007
    scPolicyViolation = 1008
    scTooLarge = 1009
    scMissingExt = 1010
    scInternalError = 1011
    scRestart = 1012
    scTryAgainLater = 1013
    scReserved2 = 1014
    scTLSHandshake = 1015

  MessageEvent* {.importc.} = object of Event
    data*: cstring
    origin*: cstring

  CloseEvent* {.importc.} = object of Event
    code*: Natural ## To learn more, see here: https://developer.mozilla.org/en-US/docs/Web/API/CloseEvent#Properties
    reason*: cstring
    wasClean*: bool

  ReadyState* {.pure.} = enum
    Connecting = 0, Open = 1, Closing = 2, Closed = 3

  WebSocket* {.importc.} = ref object of EventTarget
    url*: cstring
    protocol*: cstring
    readyState*: ReadyState
    onopen*: proc (event: Event)
    onclose*: proc (event: CloseEvent)
    onmessage*: proc (event: MessageEvent)

proc openws*(url: cstring): WebSocket {.importcpp: "new WebSocket(#)", deprecated.}

proc openws*(url: string, protocols: seq[string]): WebSocket
  {.importcpp: "new WebSocket(#,@)", deprecated.}

proc newWebSocket*(url: cstring): WebSocket {.importcpp: "new WebSocket(#)".}

proc newWebSocket*(url: cstring, protocol: cstring): WebSocket
  {.importcpp: "new WebSocket(#,@)".}

proc newWebSocket*(url: cstring, protocols: seq[cstring]): WebSocket
  {.importcpp: "new WebSocket(#,@)".}

{.push importcpp.}

proc addEventListener*(et: EventTarget; ev: cstring;
  cb: proc (ev: MessageEvent | CloseEvent))

proc send*(socket: WebSocket, data: cstring)
proc close*(socket: WebSocket)
proc close*(socket: WebSocket, code: StatusCode | Natural)
proc close*(socket: WebSocket, code: StatusCode | Natural, reason: cstring)

#[ Convenience ]#
when defined test:
  import dom
  from strutils import join
  proc append*(toID:string = "output",s:varargs[string, `$`]) =
    ## Convenience to append to a specific id
    ## Basically ``echo`` for the js target, but allows to specify where to append to
    var p = document.createelement("P")
    p.innerHtml = s.join
    let parent = document.getElementById(toID)
    parent.appendChild(p)

when isMainModule:
  var socket = newWebSocket("ws://echo.websocket.org/")

  socket.onopen = proc (e:Event) =
    echo("sent: test")
    socket.send("test")
  socket.onmessage = proc (e:MessageEvent) =
    echo("received: ",e.data)
    socket.close(StatusCode(1000),"received msg")
  socket.onclose = proc (e:CloseEvent) =
    echo("closing: ",e.reason)

