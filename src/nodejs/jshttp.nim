## * Async HTTP / HTTPS Web Server.
from std/jsffi import JsObject
from jsbuffer import Buffer

type
  HttpAgent* {.importjs: "http.Agent".} = ref object of JsRoot                  ## https://nodejs.org/api/http.html#http_class_http_agent
    freeSockets*, requests*, sockets*: JsObject
    maxFreeSockets*, maxSockets*, maxTotalSockets*: cint

  HttpClientRequest* {.importjs: "http.ClientRequest".} = ref object of JsRoot  ## https://nodejs.org/api/http.html#http_class_http_clientrequest
    aborted*, destroyed*, finished*, reusedSocket*, writableEnded*, writableFinished*: bool
    metod* {.importjs: "method".}: cstring
    path*, host*, protocol*: cstring
    maxHeadersCount*: cint

  HttpServer* {.importjs: "http.Server".} = ref object of JsRoot                ## https://nodejs.org/api/http.html#http_class_http_server
    headersTimeout*, maxHeadersCount*, requestTimeout*, timeout*, keepAliveTimeout*, defaultMaxListeners*, maxConnections*: cint
    listening*, captureRejections*: bool
    errorMonitor*: cstring

  HttpsServer* {.importjs: "https.Server".} = ref object of JsRoot                ## https://nodejs.org/api/http.html#http_class_http_server
    headersTimeout*, maxHeadersCount*, requestTimeout*, timeout*, keepAliveTimeout*, defaultMaxListeners*, maxConnections*: cint
    listening*, captureRejections*: bool
    errorMonitor*: cstring

  HttpServerResponse* {.importjs: "http.ServerResponse".} = ref object of JsRoot
    finished*, headersSent*, sendDate*, writableEnded*, writableFinished*: bool
    statusCode*: cint
    statusMessage*: cstring

  HttpIncomingMessage* {.importjs: "http.IncomingMessage".} = ref object of JsRoot  ## https://nodejs.org/api/http.html#http_class_http_incomingmessage
    aborted*, complete*: bool
    headers*, trailers*: JsObject
    metod* {.importjs: "method".}: cstring
    httpVersion*, statusMessage*, url*: cstring
    rawHeaders*, rawTrailers*: seq[cstring]
    statusCode*: cint

  HttpOutgoingMessage* {.importjs: "http.OutgoingMessage".} = ref object of JsRoot  ## https://nodejs.org/api/http.html#http_class_http_outgoingmessage
    headersSent*, writableEnded*, writableFinished*, writableObjectMode: bool
    writableCorked*, writableHighWaterMark*, writableLength*: cint

let
  httpMETHODS* {.importjs: "http.METHODS".}: seq[cstring]
  httpSTATUS_CODES* {.importjs: "http.STATUS_CODES".}: JsObject
  httpglobalAgent* {.importjs: "http.globalAgent".}: HttpAgent
  httpmaxHeaderSize* {.importjs: "http.maxHeaderSize".}: cint

func importHttp*() {.importjs: "import * as http from 'http'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireHttp*() {.importjs: "const http = require('http')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func newHttpAgent*(): HttpAgent {.importjs: "(new Agent())@".}
  ## https://nodejs.org/api/http.html#http_new_agent_options

func newHttpAgent*(options: JsObject): HttpAgent {.importjs: "(new Agent(#))".}
  ## https://nodejs.org/api/http.html#http_new_agent_options

func destroy*(self: HttpAgent or HttpIncomingMessage or HttpOutgoingMessage or HttpClientRequest): auto {.importjs: "#.$1()", discardable.}
  ## https://nodejs.org/api/http.html#http_agent_destroy

func getName*(self: HttpAgent; options: JsObject): cstring {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http.html#http_agent_getname_options

func abort*(self: HttpClientRequest) {.importjs: "#.$1()", discardable.}
  ## https://nodejs.org/api/http.html#http_request_abort

func ends*(self: HttpClientRequest or HttpServerResponse or HttpOutgoingMessage; data: cstring or Buffer; encoding = "utf-8".cstring): auto {.importjs: "#.end(#, #)", discardable.}
  ## https://nodejs.org/api/http.html#http_request_end_data_encoding_callback

func ends*[T](self: HttpClientRequest or HttpServerResponse or HttpOutgoingMessage; callback: T): auto {.importjs: "#.end(#)", discardable.}
  ## https://nodejs.org/api/http.html#http_request_end_data_encoding_callback

func ends*(self: HttpClientRequest or HttpServerResponse or HttpOutgoingMessage): auto {.importjs: "#.end()", discardable.}
  ## https://nodejs.org/api/http.html#http_request_end_data_encoding_callback

func flushHeaders*(self: HttpClientRequest or HttpServerResponse or HttpOutgoingMessage) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/http.html#http_request_flushheaders

func getHeader*(self: HttpClientRequest or HttpServerResponse; name: cstring): auto {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http.html#http_request_getheader_name

func getRawHeaderNames*(self: HttpClientRequest): seq[cstring] {.importjs: "#.$1()".}
  ## https://nodejs.org/api/http.html#http_request_getrawheadernames

func removeHeader*(self: HttpClientRequest or HttpServerResponse or HttpOutgoingMessage; name: cstring): bool {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http.html#http_request_removeheader_name

func setHeader*(self: HttpClientRequest or HttpServerResponse; name: cstring; value: auto): auto {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/http.html#http_request_setheader_name_value

func setNoDelay*(self: HttpClientRequest; noDelay: bool) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http.html#http_request_setnodelay_nodelay

func setSocketKeepAlive*(self: HttpClientRequest; enable: bool; initialDelay: cint) {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/http.html#http_request_setsocketkeepalive_enable_initialdelay

func setSocketKeepAlive*(self: HttpClientRequest) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/http.html#http_request_setsocketkeepalive_enable_initialdelay

func setTimeout*[T](self: HttpClientRequest or HttpServer or HttpsServer or HttpIncomingMessage or HttpOutgoingMessage; timeout: cint; callback: T): auto {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/http.html#http_request_settimeout_timeout_callback

func write*[T](self: HttpClientRequest or HttpServerResponse or HttpOutgoingMessage; callback: T): bool {.importjs: "#.$1(#)", discardable.}
  ## https://nodejs.org/api/http.html#http_request_write_chunk_encoding_callback

func write*(self: HttpClientRequest or HttpServerResponse or HttpOutgoingMessage; data: cstring; encoding = "utf-8".cstring): bool {.importjs: "#.$1(# + '\\n', #)", discardable.}
  ## https://nodejs.org/api/http.html#http_request_write_chunk_encoding_callback
  ## * `'\n'` is automatically inserted at the end of `data` string.

func write*(self: HttpClientRequest or HttpServerResponse or HttpOutgoingMessage; data: Buffer): bool {.importjs: "#.$1(#)", discardable.}
  ## https://nodejs.org/api/http.html#http_request_write_chunk_encoding_callback

func close*(self: HttpServer or HttpsServer) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/http.html#http_server_close_callback

func close*[T](self: HttpServer or HttpsServer; callback: T) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http.html#http_server_close_callback

func listen*(self: HttpServer or HttpsServer) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/http.html#http_server_listen

func listen*(self: HttpServer or HttpsServer; handle: JsObject; backlog: cint) {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/http.html#http_server_listen

func listen*[T](self: HttpServer or HttpsServer; callback: T) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http.html#http_server_listen

func listen*[T](self: HttpServer or HttpsServer; options: JsObject; callback: T) {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/http.html#http_server_listen

func listen*[T](self: HttpServer or HttpsServer; path: cstring; backlog: cint; callback: T) {.importjs: "#.$1(#, #, #)".}
  ## https://nodejs.org/api/http.html#http_server_listen

func listen*[T](self: HttpServer or HttpsServer; port: int; host: cstring; callback: T) {.importjs: "#.$1(#, #, #)".}
  ## https://nodejs.org/api/http.html#http_server_listen

func listen*(self: HttpServer or HttpsServer; port: int; host: cstring) {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/http.html#http_server_listen

func listen*(self: HttpServer or HttpsServer; port: int) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http.html#http_server_listen

func addTrailers*(self: HttpServerResponse or HttpOutgoingMessage; headers: JsObject) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http.html#http_response_addtrailers_headers

func cork*(self: HttpServerResponse or HttpOutgoingMessage) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/http.html#http_response_cork

func uncork*(self: HttpServerResponse or HttpOutgoingMessage) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/http.html#http_response_uncork

func getHeaderNames*(self: HttpServerResponse or HttpOutgoingMessage): seq[cstring] {.importjs: "#.$1()".}
  ## https://nodejs.org/api/http.html#http_response_getheadernames

func getHeaders*(self: HttpServerResponse or HttpOutgoingMessage): JsObject {.importjs: "#.$1()".}
  ## https://nodejs.org/api/http.html#http_response_getheaders

func hasHeader*(self: HttpServerResponse or HttpOutgoingMessage; name: cstring): bool {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http.html#http_response_hasheader_name

func writeContinue*(self: HttpServerResponse) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/http.html#http_response_hasheader_name

func writeHead*(self: HttpServerResponse; statusCode: int; statusMessage: cstring): HttpServerResponse {.importjs: "#.$1(#, #)", discardable.}
  ## https://nodejs.org/api/http.html#http_response_writehead_statuscode_statusmessage_headers

func writeHead*(self: HttpServerResponse; headers: JsObject or openArray[auto]): HttpServerResponse {.importjs: "#.$1(#)", discardable.}
  ## https://nodejs.org/api/http.html#http_response_writehead_statuscode_statusmessage_headers

func writeHead*(self: HttpServerResponse; statusCode: int; statusMessage: cstring; headers: openArray[(cstring, cstring)]): HttpServerResponse {.importjs: "#.$1(#, #)", discardable.}
  ## https://nodejs.org/api/http.html#http_response_writehead_statuscode_statusmessage_headers

func writeProcessing*(self: HttpServerResponse) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/http.html#http_response_writeprocessing

func pipe*(self: HttpOutgoingMessage) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/http.html#http_outgoingmessage_pipe

func createServer*[T](options: JsObject; requestListener: T): HttpServer {.importjs: "http.$1(#, #)".}
  ## https://nodejs.org/api/http.html#http_http_createserver_options_requestlistener

func createServer*(options: JsObject): HttpServer {.importjs: "http.$1(#)".}
  ## https://nodejs.org/api/http.html#http_http_createserver_options_requestlistener

func createServer*[T](requestListener: T): HttpServer {.importjs: "http.$1(#)".}
  ## https://nodejs.org/api/http.html#http_http_createserver_options_requestlistener

func createServer*(): HttpServer {.importjs: "http.$1()".}
  ## https://nodejs.org/api/http.html#http_http_createserver_options_requestlistener

func get*[T](options: JsObject; callback: T): HttpClientRequest {.importjs: "http.$1(#, #)".}
  ## https://nodejs.org/api/http.html#http_http_get_options_callback

func get*[T](url: cstring; options: JsObject; callback: T): HttpClientRequest {.importjs: "http.$1(#, #, #)".}
  ## https://nodejs.org/api/http.html#http_http_get_options_callback

func get*(url: cstring): HttpClientRequest {.importjs: "http.$1(#)".}
  ## https://nodejs.org/api/http.html#http_http_get_options_callback

func request*[T](options: JsObject; callback: T): HttpClientRequest {.importjs: "http.$1(#, #)".}
  ## https://nodejs.org/api/http.html#http_http_request_options_callback

func request*[T](url: cstring; options: JsObject; callback: T): HttpClientRequest {.importjs: "http.$1(#, #, #)".}
  ## https://nodejs.org/api/http.html#http_http_request_options_callback

func request*(url: cstring): HttpClientRequest {.importjs: "http.$1(#)".}
  ## https://nodejs.org/api/http.html#http_http_request_options_callback

proc validateHeaderName*(name: cstring) {.importjs: "http.$1(#)".}
  ## https://nodejs.org/api/http.html#http_http_validateheadername_name
  ##
  ## .. warning:: May or may not raise a foreign Error, use `try` ... `except`

proc validateHeaderValue*(name: cstring; value: auto) {.importjs: "http.$1(#, #)".}
  ## https://nodejs.org/api/http.html#http_http_validateheadervalue_name_value
  ##
  ## .. warning:: May or may not raise a foreign Error, use `try` ... `except`

func address*(self: HttpServer or HttpsServer): cstring {.importjs: "#.$1()".}

func rawListeners*(self: HttpServer or HttpsServer; event: cstring): seq[auto] {.importjs: "#.$1(#)".}

func removeAllListeners*(self: HttpServer or HttpsServer; event: cstring) {.importjs: "#.$1(#)", discardable.}

func listeners*(self: HttpServer or HttpsServer; eventName: cstring): seq[auto] {.importjs: "#.$1(#)".}

func listenerCount*(self: HttpServer or HttpsServer; eventName: cstring): cint {.importjs: "#.$1(#)".}

func getMaxListeners*(self: HttpServer or HttpsServer): cint {.importjs: "#.$1()".}

func prependListener*[T](self: HttpServer or HttpsServer; event: cstring; callback: T) {.importjs: "#.$1(#, #)", discardable.}

func prependOnceListener*[T](self: HttpServer or HttpsServer; event: cstring; callback: T) {.importjs: "#.$1(#, #)", discardable.}

func `emit`*(self: HttpServer or HttpsServer; eventName: cstring; args: auto) {.importjs: "#.emit(#, #)", varargs, discardable.}

func `off`*[T](self: HttpServer or HttpsServer; event: cstring; callback: T) {.importjs: "#.off(#, #)", discardable.}

func `once`*[T](self: HttpServer or HttpsServer; event: cstring; callback: T) {.importjs: "#.once(#, #)", discardable.}

func `on`*[T](self: HttpServer or HttpsServer; event: cstring; callback: T) {.importjs: "#.on(#, #)", discardable.}

template onCheckContinue*(self: HttpServer or HttpsServer; callback) =
  ## Alias for `httpServer.on(event = cstring("checkContinue"), callback)`.
  self.`on`("checkContinue".cstring, callback)

template onCheckExpectation*(self: HttpServer or HttpsServer; callback) =
  ## Alias for `httpServer.on(event = cstring("checkExpectation"), callback)`.
  self.`on`("checkExpectation".cstring, callback)

template onClientError*(self: HttpServer or HttpsServer; callback) =
  ## Alias for `httpServer.on(event = cstring("clientError"), callback)`.
  self.`on`("clientError".cstring, callback)

template onClose*(self: HttpServer or HttpsServer; callback) =
  ## Alias for `httpServer.on(event = cstring("close"), callback)`.
  self.`on`("close".cstring, callback)

template onConnect*(self: HttpServer or HttpsServer; callback) =
  ## Alias for `httpServer.on(event = cstring("connect"), callback)`.
  self.`on`("connect".cstring, callback)

template onConnection*(self: HttpServer or HttpsServer; callback) =
  ## Alias for `httpServer.on(event = cstring("connection"), callback)`.
  self.`on`("connection".cstring, callback)

template onRequest*(self: HttpServer or HttpsServer; callback) =
  ## Alias for `httpServer.on(event = cstring("request"), callback)`.
  self.`on`("request".cstring, callback)

template onUpgrade*(self: HttpServer or HttpsServer; callback) =
  ## Alias for `httpServer.on(event = cstring("upgrade"), callback)`.
  self.`on`("upgrade".cstring, callback)

template onError*(self: HttpServer or HttpsServer; callback) =
  ## Alias for `httpServer.on(event = cstring("error"), callback)`.
  self.`on`("error".cstring, callback)

template onListening*(self: HttpServer or HttpsServer; callback) =
  ## Alias for `httpServer.on(event = cstring("listening"), callback)`.
  self.`on`("listening".cstring, callback)

template onNewListener*(self: HttpServer or HttpsServer; callback) =
  ## Alias for `httpServer.on(event = cstring("newListener"), callback)`.
  self.`on`("newListener".cstring, callback)

template onRemoveListener*(self: HttpServer or HttpsServer; callback) =
  ## Alias for `httpServer.on(event = cstring("removeListener"), callback)`.
  self.`on`("removeListener".cstring, callback)


func importHttps*() {.importjs: "import * as https from 'https'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireHttps*() {.importjs: "const https = require('https')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func createServerHttps*[T](options: JsObject; requestListener: T): HttpsServer {.importjs: "https.createServer(#, #)".}
  ## https://nodejs.org/api/http.html#http_http_createserver_options_requestlistener

func createServerHttps*(options: JsObject): HttpsServer {.importjs: "https.createServer(#)".}
  ## https://nodejs.org/api/http.html#http_http_createserver_options_requestlistener

func createServerHttps*[T](requestListener: T): HttpsServer {.importjs: "https.createServer(#)".}
  ## https://nodejs.org/api/http.html#http_http_createserver_options_requestlistener

func createServerHttps*(): HttpsServer {.importjs: "https.createServer()".}
  ## https://nodejs.org/api/http.html#http_http_createserver_options_requestlistener

func getHttps*[T](options: JsObject; callback: T): HttpClientRequest {.importjs: "https.get(#, #)".}
  ## https://nodejs.org/api/http.html#http_http_get_options_callback

func getHttps*[T](url: cstring; options: JsObject; callback: T): HttpClientRequest {.importjs: "https.get(#, #, #)".}
  ## https://nodejs.org/api/http.html#http_http_get_options_callback

func getHttps*(url: cstring): HttpClientRequest {.importjs: "https.get(#)".}
  ## https://nodejs.org/api/http.html#http_http_get_options_callback

func requestHttps*[T](options: JsObject; callback: T): HttpClientRequest {.importjs: "https.get(#, #)".}
  ## https://nodejs.org/api/http.html#http_http_request_options_callback

func requestHttps*[T](url: cstring; options: JsObject; callback: T): HttpClientRequest {.importjs: "https.get(#, #, #)".}
  ## https://nodejs.org/api/http.html#http_http_request_options_callback

func requestHttps*(url: cstring): HttpClientRequest {.importjs: "https.get(#)".}
  ## https://nodejs.org/api/http.html#http_http_request_options_callback


runnableExamples("-r:off -b:js --experimental:strictFuncs"):
  import std/jsconsole
  requireHttp()  ## Example is "Verbose on Purpose" to show types, names, etc.

  func listener(request: HttpClientRequest; response: HttpServerResponse) =
    response.writeHead(statusCode = 200, statusMessage = "OK".cstring,
      headers = {"Content-Type".cstring: "text/html".cstring, "DNT".cstring: "1".cstring})
    response.write("<h1> Hello World </h1>".cstring)
    response.ends("<hr>".cstring)

  proc example() =
    console.log "This is an example"

  let server: HttpServer = createServer(requestListener = listener)
  server.onRequest((proc () = console.log "Hello"))
  server.listen(port = 8000, host = "127.0.0.1", callback = example)

runnableExamples("-r:off -b:js --experimental:strictFuncs"):
  import std/jsconsole # "HTTPS" example.
  requireHttp()   ## Has all methods for both HTTP and HTTPS, DRY.
  requireHttps()  ## Has the HTTPS web server type only.

  func listener(request: HttpClientRequest; response: HttpServerResponse) =
    response.writeHead(statusCode = 200, statusMessage = "OK".cstring,
      headers = {"Content-Type".cstring: "text/html".cstring, "DNT".cstring: "1".cstring})
    response.write("<h1> Hello World </h1>".cstring)
    response.ends("<hr>".cstring)

  proc example() =
    console.log "This is an example"

  let server: HttpsServer = createServerHttps(requestListener = listener)  # See "HTTPS" in name.
  server.onRequest((proc () = console.log "Hello"))
  server.listen(port = 8000, host = "127.0.0.1", callback = example)
