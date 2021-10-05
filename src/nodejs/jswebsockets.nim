## * WebSockets for JavaScript targets.
from std/dom import Event, EventTarget
export Event

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
    data*, origin*: cstring

  CloseEvent* {.importc.} = object of Event
    code*: cint ## https://developer.mozilla.org/en-US/docs/Web/API/CloseEvent#Properties
    reason*: cstring
    wasClean*: bool

  ReadyState* {.pure.} = enum
    Connecting = 0, Open = 1, Closing = 2, Closed = 3

  WebSocket* {.importc.} = ref object of EventTarget
    url*, protocol*: cstring
    readyState*: ReadyState
    onopen*: proc (event: Event)
    onclose*: proc (event: CloseEvent)
    onmessage*: proc (event: MessageEvent)

func newWebSocket*(url: cstring): WebSocket {.importjs: "(new WebSocket(#))".}
func newWebSocket*(url: cstring, protocol: cstring): WebSocket {.importjs: "(new WebSocket(#, @))".}
func newWebSocket*(url: cstring, protocols: seq[cstring]): WebSocket {.importjs: "(new WebSocket(#, @))".}

{.push importcpp.}
func addEventListener*(et: EventTarget; ev: cstring; cb: proc (ev: MessageEvent | CloseEvent))
func send*(socket: WebSocket, data: cstring)
func close*(socket: WebSocket)
func close*(socket: WebSocket; code: StatusCode or Natural)
func close*(socket: WebSocket; code: StatusCode or Natural; reason: cstring)
{.pop.}


runnableExamples"-b:js -d:nodejs -r:off":
  var socket = newWebSocket("ws://echo.websocket.org/")
  socket.onopen = proc (e: Event) =
    echo("sent: test")
    socket.send("test")
  socket.onmessage = proc (e: MessageEvent) =
    echo("received: ", e.data)
    socket.close(StatusCode(1000), "received msg")
  socket.onclose = proc (e: CloseEvent) =
    echo("closing: ", e.reason)
