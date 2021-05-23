## * Async HTTPS 2.0 Web Server.
from std/jsffi import JsObject
from jsbuffer import Buffer

type
  Http2SecureServer* {.importjs: "http.Http2SecureServer".} = ref object of JsRoot  ## https://nodejs.org/api/http2.html#http2_class_http2secureserver
    headersTimeout*, maxHeadersCount*, requestTimeout*, timeout*, keepAliveTimeout*, defaultMaxListeners*, maxConnections*: cint
    listening*, captureRejections*: bool
    errorMonitor*: cstring

  Http2Server* {.importjs: "http.Http2Server".} = ref object of JsRoot ## https://nodejs.org/api/http2.html#http2_class_http2server
    headersTimeout*, maxHeadersCount*, requestTimeout*, timeout*, keepAliveTimeout*, defaultMaxListeners*, maxConnections*: cint
    listening*, captureRejections*: bool
    errorMonitor*: cstring

  ClientHttp2Stream* {.importjs: "http2.ClientHttp2Stream".} = ref object of JsRoot    ## https://nodejs.org/api/http2.html#http2_class_clienthttp2stream

  ClientHttp2Session* {.importjs: "http2.ClientHttp2Session".} = ref object of JsRoot  ## https://nodejs.org/api/http2.html#http2_class_clienthttp2session

  Http2Session* {.importjs: "http2.Http2Session".} = ref object of JsRoot  ## https://nodejs.org/api/http2.html#http2_class_http2session
    alpnProtocol*: cstring        ## https://nodejs.org/api/http2.html#http2_http2session_alpnprotocol

  Http2Settings* = ref object of JsRoot  ## https://nodejs.org/api/http2.html#http2_settings_object
    headerTableSize*: cint        ## Maximum number of bytes used for header compression. The minimum allowed value is 0. The maximum allowed value is 2232-1. Default: 4096.
    enablePush*: bool             ## true if HTTP/2 Push Streams are to be permitted on the Http2Session instances. Default: true.
    initialWindowSize*: cint      ## Sender initial window size in bytes for stream-level flow control. The minimum allowed value is 0. The maximum allowed value is 232-1. Default: 65535.
    maxFrameSize*: cint           ## Size in bytes of the largest frame payload. The minimum allowed value is 16,384. The maximum allowed value is 2224-1. Default: 16384.
    maxConcurrentStreams*: cint   ## Maximum number of concurrent streams permitted on an Http2Session. There is no default value which implies, at least theoretically, 232-1 streams may be open concurrently at any given time in an Http2Session. The minimum value is 0. The maximum allowed value is 232-1. Default: 4294967295.
    maxHeaderListSize*: cint      ## Maximum size (uncompressed octets) of header list that will be accepted. The minimum allowed value is 0. The maximum allowed value is 2232-1. Default: 65535.
    maxHeaderSize*: cint          ## Alias for maxHeaderListSize.
    enableConnectProtocol*: bool  ## true if the "Extended Connect Protocol" defined by RFC 8441 is to be enabled. This setting is only meaningful if sent by the server. Once the enableConnectProtocol setting has been enabled for a given Http2Session, it cannot be disabled. Default: false.

  Http2Stream* {.importjs: "http2.Http2Stream".} = ref object of JsRoot  ## https://nodejs.org/api/http2.html#http2_class_http2stream
    aborted*: bool             ## https://nodejs.org/api/http2.html#http2_http2stream_aborted
    bufferSize*: cint          ## https://nodejs.org/api/http2.html#http2_http2stream_buffersize
    closed*: bool              ## https://nodejs.org/api/http2.html#http2_http2stream_closed
    destroyed*: bool           ## https://nodejs.org/api/http2.html#http2_http2stream_destroyed
    endAfterHeaders*: bool     ## https://nodejs.org/api/http2.html#http2_http2stream_endafterheaders
    id*: cint                  ## https://nodejs.org/api/http2.html#http2_http2stream_id
    pending*: bool             ## https://nodejs.org/api/http2.html#http2_http2stream_pending
    rstCode*: cint             ## https://nodejs.org/api/http2.html#http2_http2stream_rstcode
    sentHeaders*: JsObject     ## https://nodejs.org/api/http2.html#http2_http2stream_sentheaders
    sentInfoHeaders*: JsObject ## https://nodejs.org/api/http2.html#http2_http2stream_sentinfoheaders
    sentTrailers*: JsObject    ## https://nodejs.org/api/http2.html#http2_http2stream_senttrailers
    session*: Http2Session     ## https://nodejs.org/api/http2.html#http2_http2stream_session
    state*: JsObject           ## https://nodejs.org/api/http2.html#http2_http2stream_state

  ServerHttp2Stream* {.importjs: "http2.ServerHttp2Stream".} = ref object of JsRoot  ## https://nodejs.org/api/http2.html#http2_class_serverhttp2stream
    aborted*: bool             ## https://nodejs.org/api/http2.html#http2_http2stream_aborted
    bufferSize*: cint          ## https://nodejs.org/api/http2.html#http2_http2stream_buffersize
    closed*: bool              ## https://nodejs.org/api/http2.html#http2_http2stream_closed
    destroyed*: bool           ## https://nodejs.org/api/http2.html#http2_http2stream_destroyed
    endAfterHeaders*: bool     ## https://nodejs.org/api/http2.html#http2_http2stream_endafterheaders
    id*: cint                  ## https://nodejs.org/api/http2.html#http2_http2stream_id
    pending*: bool             ## https://nodejs.org/api/http2.html#http2_http2stream_pending
    rstCode*: cint             ## https://nodejs.org/api/http2.html#http2_http2stream_rstcode
    sentHeaders*: JsObject     ## https://nodejs.org/api/http2.html#http2_http2stream_sentheaders
    sentInfoHeaders*: JsObject ## https://nodejs.org/api/http2.html#http2_http2stream_sentinfoheaders
    sentTrailers*: JsObject    ## https://nodejs.org/api/http2.html#http2_http2stream_senttrailers
    session*: Http2Session     ## https://nodejs.org/api/http2.html#http2_http2stream_session
    state*: JsObject           ## https://nodejs.org/api/http2.html#http2_http2stream_state
    headersSent*: bool         ## https://nodejs.org/api/http2.html#http2_http2stream_headerssent
    pushAllowed*: bool         ## https://nodejs.org/api/http2.html#http2_http2stream_pushallowed

  Http2ServerRequest* {.importjs: "http2.ServerHttp2Stream".} = ref object of JsRoot  ## https://nodejs.org/api/http2.html#http2_class_http2_http2serverrequest
    aborted*: bool             ## https://nodejs.org/api/http2.html#http2_request_aborted
    authority*: cstring        ## https://nodejs.org/api/http2.html#http2_request_authority
    complete*: bool            ## https://nodejs.org/api/http2.html#http2_request_complete
    headers*: JsObject         ## https://nodejs.org/api/http2.html#http2_request_headers
    httpVersion*: cstring      ## https://nodejs.org/api/http2.html#http2_request_httpversion
    rawHeaders*: seq[string]   ## https://nodejs.org/api/http2.html#http2_request_rawheaders
    rawTrailers*: seq[string]  ## https://nodejs.org/api/http2.html#http2_request_rawtrailers
    scheme*: cstring           ## https://nodejs.org/api/http2.html#http2_request_scheme
    stream*: Http2Stream       ## https://nodejs.org/api/http2.html#http2_request_stream
    trailers*: JsObject        ## https://nodejs.org/api/http2.html#http2_request_trailers
    url*: cstring              ## https://nodejs.org/api/http2.html#http2_request_url
    metod* {.importjs: "method".}: cstring  ## https://nodejs.org/api/http2.html#http2_request_method

  Http2ServerResponse* {.importjs: "http2.Http2ServerResponse".} = ref object of JsRoot  ##
    finished*: bool            ## https://nodejs.org/api/http2.html#http2_response_finished
    headersSent*: bool         ## https://nodejs.org/api/http2.html#http2_response_headerssent
    req*: Http2ServerRequest   ## https://nodejs.org/api/http2.html#http2_response_req
    sendDate*: bool            ## https://nodejs.org/api/http2.html#http2_response_senddate
    statusCode*: cint          ## https://nodejs.org/api/http2.html#http2_response_statuscode
    statusMessage*: cstring    ## https://nodejs.org/api/http2.html#http2_response_statusmessage
    stream*: Http2Stream       ## https://nodejs.org/api/http2.html#http2_response_stream
    writableEnded*: bool       ## https://nodejs.org/api/http2.html#http2_response_writableended


let
  sensitiveHeaders*            {.importjs: "http2.sensitiveHeaders".}:                  JsObject ## https://nodejs.org/api/http2.html#http2_http2_sensitiveheaders
  NGHTTP2_NO_ERROR*            {.importjs: "http2.constants.NGHTTP2_NO_ERROR".}:            cint ## https://nodejs.org/api/http2.html#http2_http2_constants
  NGHTTP2_PROTOCOL_ERROR*      {.importjs: "http2.constants.NGHTTP2_PROTOCOL_ERROR".}:      cint ## https://nodejs.org/api/http2.html#http2_http2_constants
  NGHTTP2_INTERNAL_ERROR*      {.importjs: "http2.constants.NGHTTP2_INTERNAL_ERROR".}:      cint ## https://nodejs.org/api/http2.html#http2_http2_constants
  NGHTTP2_FLOW_CONTROL_ERROR*  {.importjs: "http2.constants.NGHTTP2_FLOW_CONTROL_ERROR".}:  cint ## https://nodejs.org/api/http2.html#http2_http2_constants
  NGHTTP2_SETTINGS_TIMEOUT*    {.importjs: "http2.constants.NGHTTP2_SETTINGS_TIMEOUT".}:    cint ## https://nodejs.org/api/http2.html#http2_http2_constants
  NGHTTP2_STREAM_CLOSED*       {.importjs: "http2.constants.NGHTTP2_STREAM_CLOSED".}:       cint ## https://nodejs.org/api/http2.html#http2_http2_constants
  NGHTTP2_FRAME_SIZE_ERROR*    {.importjs: "http2.constants.NGHTTP2_FRAME_SIZE_ERROR".}:    cint ## https://nodejs.org/api/http2.html#http2_http2_constants
  NGHTTP2_REFUSED_STREAM*      {.importjs: "http2.constants.NGHTTP2_REFUSED_STREAM".}:      cint ## https://nodejs.org/api/http2.html#http2_http2_constants
  NGHTTP2_CANCEL*              {.importjs: "http2.constants.NGHTTP2_CANCEL".}:              cint ## https://nodejs.org/api/http2.html#http2_http2_constants
  NGHTTP2_COMPRESSION_ERROR*   {.importjs: "http2.constants.NGHTTP2_COMPRESSION_ERROR".}:   cint ## https://nodejs.org/api/http2.html#http2_http2_constants
  NGHTTP2_CONNECT_ERROR*       {.importjs: "http2.constants.NGHTTP2_CONNECT_ERROR".}:       cint ## https://nodejs.org/api/http2.html#http2_http2_constants
  NGHTTP2_ENHANCE_YOUR_CALM*   {.importjs: "http2.constants.NGHTTP2_ENHANCE_YOUR_CALM".}:   cint ## https://nodejs.org/api/http2.html#http2_http2_constants
  NGHTTP2_INADEQUATE_SECURITY* {.importjs: "http2.constants.NGHTTP2_INADEQUATE_SECURITY".}: cint ## https://nodejs.org/api/http2.html#http2_http2_constants
  NGHTTP2_HTTP_1_1_REQUIRED*   {.importjs: "http2.constants.NGHTTP2_HTTP_1_1_REQUIRED".}:   cint ## https://nodejs.org/api/http2.html#http2_http2_constants


func importHttp2*() {.importjs: "import * as http2 from 'http2'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireHttp2*() {.importjs: "const http2 = require('http2')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func createSecureServer*[T](options: JsObject; requestListener: T): Http2SecureServer {.importjs: "http2.$1(#, #)".}
  ## https://nodejs.org/api/http2.html#http2_http2_createsecureserver_options_onrequesthandler

func createSecureServer*(options: JsObject): Http2SecureServer {.importjs: "http2.$1(#)".}
  ## https://nodejs.org/api/http2.html#http2_http2_createsecureserver_options_onrequesthandler

func createSecureServer*[T](requestListener: T): Http2SecureServer {.importjs: "http2.$1(#)".}
  ## https://nodejs.org/api/http2.html#http2_http2_createsecureserver_options_onrequesthandler

func destroy*(self: Http2Session or Http2ServerRequest or Http2Stream): auto {.importjs: "#.$1()", discardable.}
  ## https://nodejs.org/api/http2.html#http2_http2session_destroy_error_code

func ends*(self: Http2ServerResponse; data: cstring or Buffer; encoding = "utf-8".cstring): auto {.importjs: "#.end(#, #)", discardable.}
  ## https://nodejs.org/api/http2.html#http2_response_end_data_encoding_callback

func ends*[T](self:Http2ServerResponse; callback: T): auto {.importjs: "#.end(#)", discardable.}
  ## https://nodejs.org/api/http2.html#http2_response_end_data_encoding_callback

func ends*(self: Http2ServerResponse): auto {.importjs: "#.end()", discardable.}
  ## https://nodejs.org/api/http2.html#http2_response_end_data_encoding_callback

func getHeader*(self: Http2ServerResponse; name: cstring): auto {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http2.html#http2_response_getheader_name

func removeHeader*(self: Http2ServerResponse; name: cstring): bool {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http2.html#http2_response_removeheader_name

func setHeader*(self: Http2ServerResponse; name: cstring; value: auto): auto {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/http2.html#http2_response_setheader_name_value

func setTimeout*[T](self: Http2Server or Http2SecureServer or Http2Stream or Http2ServerRequest or Http2ServerResponse; timeout: cint; callback: T): Http2SecureServer {.importjs: "#.$1(#, #)", discardable.}
  ## https://nodejs.org/api/http2.html#http2_http2session_settimeout_msecs_callback

func write*[T](self: Http2ServerResponse; callback: T): bool {.importjs: "#.$1(#)", discardable.}
  ## https://nodejs.org/api/http2.html#http2_response_write_chunk_encoding_callback

func write*(self: Http2ServerResponse; data: cstring; encoding = "utf-8".cstring): bool {.importjs: "#.$1(# + '\\n', #)", discardable.}
  ## https://nodejs.org/api/http2.html#http2_response_write_chunk_encoding_callback
  ## * `'\n'` is automatically inserted at the end of `data` string.

func write*(self: Http2ServerResponse; data: Buffer): bool {.importjs: "#.$1(#)", discardable.}
  ## https://nodejs.org/api/http2.html#http2_response_write_chunk_encoding_callback

func close*(self: Http2SecureServer or Http2Server) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/http2.html#http2_http2session_close_callback

func close*[T](self: Http2SecureServer or Http2Server; callback: T) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http2.html#http2_http2session_close_callback

func close*[T](self: Http2Stream; code: cint; callback: T) {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/http2.html#http2_http2stream_close_code_callback

func close*(self: Http2Stream; code: cint) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http2.html#http2_http2stream_close_code_callback

func listen*(self: Http2Server or Http2SecureServer) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/http.html#http_server_listen

func listen*(self: Http2Server or Http2SecureServer; handle: JsObject; backlog: cint) {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/http.html#http_server_listen

func listen*[T](self: Http2Server or Http2SecureServer; callback: T) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http.html#http_server_listen

func listen*[T](self: Http2Server or Http2SecureServer; options: JsObject; callback: T) {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/http.html#http_server_listen

func listen*[T](self: Http2Server or Http2SecureServer; path: cstring; backlog: cint; callback: T) {.importjs: "#.$1(#, #, #)".}
  ## https://nodejs.org/api/http.html#http_server_listen

func listen*[T](self: Http2Server or Http2SecureServer; port: int; host: cstring; callback: T) {.importjs: "#.$1(#, #, #)".}
  ## https://nodejs.org/api/http.html#http_server_listen

func listen*(self: Http2Server or Http2SecureServer; port: int; host: cstring) {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/http.html#http_server_listen

func listen*(self: Http2Server or Http2SecureServer; port: int) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http.html#http_server_listen

func addTrailers*(self: Http2ServerResponse; headers: JsObject) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http2.html#http2_response_addtrailers_headers

func getHeaderNames*(self: Http2ServerResponse): seq[cstring] {.importjs: "#.$1()".}
  ## https://nodejs.org/api/http2.html#http2_response_getheadernames

func getHeaders*(self: Http2ServerResponse): JsObject {.importjs: "#.$1()".}
  ## https://nodejs.org/api/http2.html#http2_response_getheaders

func hasHeader*(self: Http2ServerResponse; name: cstring): bool {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http2.html#http2_response_hasheader_name

func writeContinue*(self: Http2ServerResponse) {.importjs: "#.$1()".}
  ## hhttps://nodejs.org/api/http2.html#http2_response_writecontinue

func writeHead*(self: Http2ServerResponse; statusCode: int; statusMessage: cstring): Http2ServerResponse {.importjs: "#.$1(#, #)", discardable.}
  ## https://nodejs.org/api/http2.html#http2_response_writehead_statuscode_statusmessage_headers

func writeHead*(self: Http2ServerResponse; headers: JsObject or openArray[auto]): Http2ServerResponse {.importjs: "#.$1(#)", discardable.}
  ## https://nodejs.org/api/http2.html#http2_response_writehead_statuscode_statusmessage_headers

func writeHead*(self: Http2ServerResponse; statusCode: int; statusMessage: cstring; headers: openArray[(cstring, cstring)]): Http2ServerResponse {.importjs: "#.$1(#, #)", discardable.}
  ## https://nodejs.org/api/http2.html#http2_response_writehead_statuscode_statusmessage_headers

func createServer*(): Http2Server {.importjs: "http.$1()".}
  ## https://nodejs.org/api/http2.html#http2_http2_createserver_options_onrequesthandler

func createServer*[T](options: JsObject; requestListener: T): Http2Server {.importjs: "http2.$1(#, #)".}
  ## https://nodejs.org/api/http2.html#http2_http2_createserver_options_onrequesthandler

func createServer*(options: JsObject): Http2Server {.importjs: "http2.$1(#)".}
  ## https://nodejs.org/api/http2.html#http2_http2_createserver_options_onrequesthandler

proc updateSettings*(self: Http2SecureServer or Http2Server; settings: Http2Settings) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http2.html#http2_server_updatesettings_settings_1

proc getDefaultSettings*(): Http2Settings {.importjs: "http2.$1()".}
  ## https://nodejs.org/api/http2.html#http2_http2_getdefaultsettings

proc getPackedSettings*(settings: Http2Settings): Buffer {.importjs: "http2.$1(#)".}
  ## https://nodejs.org/api/http2.html#http2_http2_getpackedsettings_settings

proc getUnpackedSettings*(settings: Buffer): Http2Settings {.importjs: "http2.$1(#)".}
  ## https://nodejs.org/api/http2.html#http2_http2_getunpackedsettings_buf

proc createPushResponse*[T](self: Http2ServerResponse; headers: JsObject; callback: T): Http2Settings {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/http2.html#http2_response_createpushresponse_headers_callback

proc connect*(authority: cstring; options: JsObject): ClientHttp2Session {.importjs: "http2.$1(#, #)".}
  ## https://nodejs.org/api/http2.html#http2_server_updatesettings_settings

proc connect*[T](authority: cstring; options: JsObject; callback: T): ClientHttp2Session {.importjs: "http2.$1(#, #, #)".}
  ## https://nodejs.org/api/http2.html#http2_server_updatesettings_settings

proc request*(self: ClientHttp2Session; headers: JsObject; options: JsObject): ClientHttp2Stream {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/http2.html#http2_clienthttp2session_request_headers_options

proc request*(self: ClientHttp2Session; headers: JsObject): ClientHttp2Stream {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http2.html#http2_clienthttp2session_request_headers_options

proc priority*(self: Http2Stream; options: JsObject) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http2.html#http2_http2stream_priority_options

proc sendTrailers*(self: Http2Stream; headers: JsObject) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http2.html#http2_http2stream_sendtrailers_headers

proc additionalHeaders*(self: ServerHttp2Stream; headers: JsObject) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http2.html#http2_http2stream_additionalheaders_headers

proc pushStream*[T](self: ServerHttp2Stream; headers: JsObject; options: JsObject; callback: T) {.importjs: "#.$1(#, #, #)".}
  ## https://nodejs.org/api/http2.html#http2_http2stream_additionalheaders_headers

proc pushStream*[T](self: ServerHttp2Stream; headers: JsObject; callback: T) {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/http2.html#http2_http2stream_additionalheaders_headers

proc respond*(self: ServerHttp2Stream; headers: JsObject; options: JsObject) {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/http2.html#http2_http2stream_respond_headers_options

proc respond*(self: ServerHttp2Stream; headers: JsObject) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http2.html#http2_http2stream_respond_headers_options

proc respondWithFD*(self: ServerHttp2Stream; fd: auto; headers: JsObject; options: JsObject) {.importjs: "#.$1(#, #, #)".}
  ## https://nodejs.org/api/http2.html#http2_http2stream_respondwithfd_fd_headers_options

proc respondWithFD*(self: ServerHttp2Stream; fd: auto; headers: JsObject) {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/http2.html#http2_http2stream_respondwithfd_fd_headers_options

proc respondWithFD*(self: ServerHttp2Stream; fd: auto) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http2.html#http2_http2stream_respondwithfd_fd_headers_options

proc respondWithFile*(self: ServerHttp2Stream; path: cstring or Buffer; headers: JsObject; options: JsObject) {.importjs: "#.$1(#, #, #)".}
  ## https://nodejs.org/api/http2.html#http2_http2stream_respondwithfile_path_headers_options

proc respondWithFile*(self: ServerHttp2Stream; path: cstring or Buffer; headers: JsObject) {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/http2.html#http2_http2stream_respondwithfile_path_headers_options

proc respondWithFile*(self: ServerHttp2Stream; path: cstring or Buffer) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/http2.html#http2_http2stream_respondwithfile_path_headers_options


func `on`*[T](self: Http2Server or Http2SecureServer; event: cstring; callback: T) {.importjs: "#.on(#, #)", discardable.}

template onCheckContinue*(self: Http2Server or Http2SecureServer; callback) =
  ## Alias for `self.on(event = cstring("checkContinue"), callback)`.
  self.`on`("checkContinue".cstring, callback)

template onCheckExpectation*(self: Http2Server or Http2SecureServer; callback) =
  ## Alias for `self.on(event = cstring("checkExpectation"), callback)`.
  self.`on`("checkExpectation".cstring, callback)

template onClientError*(self: Http2Server or Http2SecureServer; callback) =
  ## Alias for `self.on(event = cstring("clientError"), callback)`.
  self.`on`("clientError".cstring, callback)

template onClose*(self: Http2Server or Http2SecureServer or Http2Stream or Http2ServerRequest or Http2ServerResponse or Http2Session; callback) =
  ## Alias for `self.on(event = cstring("close"), callback)`.
  self.`on`("close".cstring, callback)

template onConnect*(self: Http2Server or Http2SecureServer or Http2Session; callback) =
  ## Alias for `self.on(event = cstring("connect"), callback)`.
  self.`on`("connect".cstring, callback)

template onConnection*(self: Http2Server or Http2SecureServer; callback) =
  ## Alias for `self.on(event = cstring("connection"), callback)`.
  self.`on`("connection".cstring, callback)

template onRequest*(self: Http2Server or Http2SecureServer; callback) =
  ## Alias for `self.on(event = cstring("request"), callback)`.
  self.`on`("request".cstring, callback)

template onError*(self: Http2Server or Http2SecureServer or Http2Session or Http2Stream; callback) =
  ## Alias for `self.on(event = cstring("error"), callback)`.
  self.`on`("error".cstring, callback)

template onFrameError*(self: Http2Server or Http2SecureServer or Http2Stream or Http2Session; callback) =
  ## Alias for `self.on(event = cstring("frameError"), callback)`.
  self.`on`("frameError".cstring, callback)

template onGoaway*(self: Http2Server or Http2SecureServer or Http2Session; callback) =
  ## Alias for `self.on(event = cstring("goaway"), callback)`.
  self.`on`("goaway".cstring, callback)

template onLocalSettings*(self: Http2Server or Http2SecureServer or Http2Session; callback) =
  ## Alias for `self.on(event = cstring("localSettings"), callback)`.
  self.`on`("localSettings".cstring, callback)

template onPing*(self: Http2Server or Http2SecureServer or Http2Session; callback) =
  ## Alias for `self.on(event = cstring("ping"), callback)`.
  self.`on`("ping".cstring, callback)

template onStream*(self: Http2Server or Http2SecureServer or Http2Session; callback) =
  ## Alias for `self.on(event = cstring("stream"), callback)`.
  self.`on`("stream".cstring, callback)

template onSessionError*(self: Http2Server or Http2SecureServer; callback) =
  ## Alias for `self.on(event = cstring("sessionError"), callback)`.
  self.`on`("sessionError".cstring, callback)

template onSession*(self: Http2Server or Http2SecureServer; callback) =
  ## Alias for `self.on(event = cstring("session"), callback)`.
  self.`on`("session".cstring, callback)

template onUnknownProtocol*(self: Http2Server or Http2SecureServer; callback) =
  ## Alias for `self.on(event = cstring("unknownProtocol"), callback)`.
  self.`on`("unknownProtocol".cstring, callback)

template onAltsvc*(self: ClientHttp2Session; callback) =
  ## Alias for `self.on(event = cstring("altsvc"), callback)`.
  self.`on`("altsvc".cstring, callback)

template onOrigin*(self: ClientHttp2Session; callback) =
  ## Alias for `self.on(event = cstring("origin"), callback)`.
  self.`on`("origin".cstring, callback)

template onAborted*(self: Http2Stream or Http2ServerRequest; callback) =
  ## Alias for `self.on(event = cstring("aborted"), callback)`.
  self.`on`("aborted".cstring, callback)

template onReady*(self: Http2Stream; callback) =
  ## Alias for `self.on(event = cstring("ready"), callback)`.
  self.`on`("ready".cstring, callback)

template onTimeout*(self: Http2Server or Http2SecureServer or Http2Stream or Http2ServerRequest or Http2ServerResponse or Http2Session; callback) =
  ## Alias for `self.on(event = cstring("timeout"), callback)`.
  self.`on`("timeout".cstring, callback)

template onTrailers*(self: Http2Stream; callback) =
  ## Alias for `self.on(event = cstring("trailers"), callback)`.
  self.`on`("trailers".cstring, callback)

template onWantTrailers*(self: Http2Stream; callback) =
  ## Alias for `self.on(event = cstring("wantTrailers"), callback)`.
  self.`on`("wantTrailers".cstring, callback)

template onHeaders*(self: ClientHttp2Stream; callback) =
  ## Alias for `self.on(event = cstring("headers"), callback)`.
  self.`on`("headers".cstring, callback)

template onContinue*(self: ClientHttp2Stream; callback) =
  ## Alias for `self.on(event = cstring("continue"), callback)`.
  self.`on`("continue".cstring, callback)

template onPush*(self: ClientHttp2Stream; callback) =
  ## Alias for `self.on(event = cstring("push"), callback)`.
  self.`on`("push".cstring, callback)

template onResponse*(self: ClientHttp2Stream; callback) =
  ## Alias for `self.on(event = cstring("response"), callback)`.
  self.`on`("response".cstring, callback)

template onFinish*(self: Http2ServerResponse; callback) =
  ## Alias for `self.on(event = cstring("finish"), callback)`.
  self.`on`("finish".cstring, callback)


func writeProcessing*(self: Http2ServerResponse) {.importjs: "#.$1()".}

func address*(self: Http2Server or Http2SecureServer): cstring {.importjs: "#.$1()".}

func rawListeners*(self: Http2Server or Http2SecureServer; event: cstring): seq[auto] {.importjs: "#.$1(#)".}

func removeAllListeners*(self: Http2Server or Http2SecureServer; event: cstring) {.importjs: "#.$1(#)", discardable.}

func listeners*(self: Http2Server or Http2SecureServer; eventName: cstring): seq[auto] {.importjs: "#.$1(#)".}

func listenerCount*(self: Http2Server or Http2SecureServer; eventName: cstring): cint {.importjs: "#.$1(#)".}

func getMaxListeners*(self: Http2Server or Http2SecureServer): cint {.importjs: "#.$1()".}

func prependListener*[T](self: Http2Server or Http2SecureServer; event: cstring; callback: T) {.importjs: "#.$1(#, #)", discardable.}

func prependOnceListener*[T](self: Http2Server or Http2SecureServer; event: cstring; callback: T) {.importjs: "#.$1(#, #)", discardable.}

func `emit`*(self: Http2Server or Http2SecureServer; eventName: cstring; args: auto) {.importjs: "#.emit(#, #)", varargs, discardable.}

func `off`*[T](self: Http2Server or Http2SecureServer; event: cstring; callback: T) {.importjs: "#.off(#, #)", discardable.}

func `once`*[T](self: Http2Server or Http2SecureServer; event: cstring; callback: T) {.importjs: "#.once(#, #)", discardable.}
