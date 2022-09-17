## * Multithreading, Thread Pool.
from std/jsffi import JsObject
from std/asyncjs import Future

type
  BroadcastChannel* {.importjs: "worker_threads.BroadcastChannel".} = ref object of JsRoot  ## https://nodejs.org/api/worker_threads.html#worker_threads_class_broadcastchannel_extends_eventtarget
  MessageChannel*   {.importjs: "worker_threads.MessageChannel".}   = ref object of JsRoot  ## https://nodejs.org/api/worker_threads.html#worker_threads_class_messagechannel
  MessagePort*      {.importjs: "worker_threads.MessagePort".}      = ref object of JsRoot  ## https://nodejs.org/api/worker_threads.html#worker_threads_class_messageport
  Worker*           {.importjs: "worker_threads.Worker".}           = ref object of JsRoot  ## https://nodejs.org/api/worker_threads.html#worker_threads_class_worker
    performance*: JsObject    ## https://nodejs.org/api/worker_threads.html#worker_threads_worker_performance
    resourceLimits*: JsObject ## https://nodejs.org/api/worker_threads.html#worker_threads_worker_resourcelimits_1
    threadId*: cint           ## https://nodejs.org/api/worker_threads.html#worker_threads_worker_threadid_1

let
  parentPort* {.importjs: "worker_threads.parentPort".}: MessagePort      ## https://nodejs.org/api/worker_threads.html#worker_threads_worker_parentport
  resourceLimits* {.importjs: "worker_threads.resourceLimits".}: JsObject ## https://nodejs.org/api/worker_threads.html#worker_threads_worker_resourcelimits
  workerThreadsThreadId* {.importjs: "worker_threads.threadId".}: cint    ## https://nodejs.org/api/worker_threads.html#worker_threads_worker_threadid
  workerData* {.importjs: "worker_threads.workerData".}: JsObject         ## https://nodejs.org/api/worker_threads.html#worker_threads_worker_threadid

func importCluster*() {.importjs: "import * as worker_threads from 'worker_threads'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireCluster*() {.importjs: "const worker_threads = require('worker_threads')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func newBroadcastChannel*(name: auto): BroadcastChannel {.importjs: "(new BroadcastChannel(#))".}
  ## https://nodejs.org/api/worker_threads.html#worker_threads_new_broadcastchannel_name

func newWorker*(filename: cstring): Worker {.importjs: "(new Worker(#))".}
  ## https://nodejs.org/api/worker_threads.html#worker_threads_new_worker_filename_options

func newWorker*(filename: cstring; options: JsObject): Worker {.importjs: "(new Worker(#, #))".}
  ## https://nodejs.org/api/worker_threads.html#worker_threads_new_worker_filename_options

func getEnvironmentData*(self: auto): auto {.importjs: "worker_threads.$1(#)".}
  ## https://nodejs.org/api/worker_threads.html#worker_threads_worker_getenvironmentdata_key

func isMainThread*(): bool {.importjs: "(worker_threads.$1() || false)".}
  ## https://nodejs.org/api/worker_threads.html#worker_threads_worker_ismainthread

func markAsUntransferable*(objct: JsObject) {.importjs: "worker_threads.$1(#)".}
  ## https://nodejs.org/api/worker_threads.html#worker_threads_worker_markasuntransferable_object

func moveMessagePortToContext*(port: MessagePort; contextifiedSandbox: JsObject): MessagePort {.importjs: "worker_threads.$1(#)".}
  ## https://nodejs.org/api/worker_threads.html#worker_threads_worker_movemessageporttocontext_port_contextifiedsandbox

func receiveMessageOnPort*(port: MessagePort): JsObject {.importjs: "(worker_threads.$1(#) || {})".}
  ## https://nodejs.org/api/worker_threads.html#worker_threads_worker_receivemessageonport_port

func setEnvironmentData*(key: auto; value: auto) {.importjs: "worker_threads.$1(#)", discardable.}
  ## https://nodejs.org/api/worker_threads.html#worker_threads_worker_setenvironmentdata_key_value

func close*(self: BroadcastChannel or MessagePort) {.importjs: "#.$1()", discardable.}
  ## https://nodejs.org/api/worker_threads.html#worker_threads_broadcastchannel_close

func postMessage*(self: BroadcastChannel or MessagePort or Worker; message: auto) {.importjs: "#.$1(#)", discardable.}
  ## https://nodejs.org/api/worker_threads.html#worker_threads_broadcastchannel_postmessage_message

func postMessage*(self: MessagePort or Worker; message: auto; transferList: openArray[JsObject]) {.importjs: "#.$1(#, #)", discardable.}
  ## https://nodejs.org/api/worker_threads.html#worker_threads_port_postmessage_value_transferlist

func refs*(self: BroadcastChannel or MessagePort or Worker) {.importjs: "#.ref()", discardable.}
  ## https://nodejs.org/api/worker_threads.html#worker_threads_broadcastchannel_ref

func unrefs*(self: BroadcastChannel or MessagePort or Worker) {.importjs: "#.unref()", discardable.}
  ## https://nodejs.org/api/worker_threads.html#worker_threads_broadcastchannel_unref

func start*(self: MessagePort) {.importjs: "#.$1()", discardable.}
  ## https://nodejs.org/api/worker_threads.html#worker_threads_port_start

func terminate*(self: Worker): Future[cstring] {.importjs: "#.$1()".}
  ## https://nodejs.org/api/worker_threads.html#worker_threads_worker_terminate

func `on`*[T](self: MessagePort; callback: T) {.importjs: "#.on(#)", discardable.}

template onMessage*(self: MessagePort; callback) =
  ## https://nodejs.org/api/worker_threads.html#worker_threads_broadcastchannel_onmessage
  self.onmessage = callback

template onMessageerror*(self: MessagePort; callback) =
  ## https://nodejs.org/api/worker_threads.html#worker_threads_broadcastchannel_onmessageerror
  self.onmessageerror = callback

template onMessageerror*(self: MessagePort; callback) =
  ## https://nodejs.org/api/worker_threads.html#worker_threads_broadcastchannel_onmessageerror
  self.onmessageerror = callback

template onClose*(self: MessagePort; callback) =
  ## Alias for `self.on(event = cstring("close"), callback)`.
  self.`on`("close".cstring, callback)

template onMessage*(self: MessagePort or Worker; callback) =
  ## Alias for `self.on(event = cstring("message"), callback)`.
  self.`on`("message".cstring, callback)

template onMessageerror*(self: MessagePort or Worker; callback) =
  ## Alias for `self.on(event = cstring("messageerror"), callback)`.
  self.`on`("messageerror".cstring, callback)

template onError*(self: MessagePort or Worker; callback) =
  ## Alias for `self.on(event = cstring("error"), callback)`.
  self.`on`("error".cstring, callback)

template onExit*(self: MessagePort or Worker; callback) =
  ## Alias for `self.on(event = cstring("exit"), callback)`.
  self.`on`("exit".cstring, callback)

template onOnline*(self: Worker; callback) =
  ## Alias for `self.on(event = cstring("online"), callback)`.
  self.`on`("online".cstring, callback)
