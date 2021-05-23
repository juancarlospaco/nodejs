## * Multiprocessing, Process Pool with IPC.
##
## .. warning:: Module currently not working, Pull Requests welcome.
from std/jsffi import JsObject

type
  Cluster* = ref object of JsRoot ## https://nodejs.org/api/cluster.html#cluster_cluster
    isMaster*, isPrimary*, isWorker*: bool
    schedulingPolicy*: cstring
    settings*, worker*, workers*: JsObject

  Worker* = ref object of JsRoot  ## https://nodejs.org/api/cluster.html#cluster_class_worker
    exitedAfterDisconnect*: bool
    id*: int

func importCluster*() {.importjs: "import * as cluster from 'cluster'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireCluster*() {.importjs: "const cluster = require('cluster')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func disconnect*(self: Worker): auto {.importjs: "#.$1()", discardable.}
  ## https://nodejs.org/api/cluster.html#cluster_worker_disconnect

func disconnect*(self: Cluster) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/cluster.html#cluster_cluster_disconnect_callback

func disconnect*[T](self: Cluster; callback: T) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/cluster.html#cluster_cluster_disconnect_callback

func isConnected*(self: Worker): bool {.importjs: "#.$1()".}
  ## https://nodejs.org/api/cluster.html#cluster_worker_isconnected

func isDead*(self: Worker): bool {.importjs: "#.$1()".}
  ## https://nodejs.org/api/cluster.html#cluster_worker_isdead

func kill*(self: Worker; signal = "SIGTERM".cstring) {.importjs: "#.$1(#)", discardable.}
  ## https://nodejs.org/api/cluster.html#cluster_worker_kill_signal

func send*(self: Worker; message: JsObject): bool {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/cluster.html#cluster_worker_send_message_sendhandle_options_callback

func send*[T](self: Worker; message: JsObject; callback: T): bool {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/cluster.html#cluster_worker_send_message_sendhandle_options_callback

func fork*(): Worker {.importjs: "cluster.$1()", discardable.}
  ## https://nodejs.org/api/cluster.html#cluster_cluster_fork_env

func setupPrimary*(self: Cluster; settings: JsObject) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/cluster.html#cluster_cluster_fork_env

func setupPrimary*(self: Cluster) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/cluster.html#cluster_cluster_fork_env

func setupMaster*(self: Cluster; settings: JsObject) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/cluster.html#cluster_cluster_fork_env

func setupMaster*(self: Cluster) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/cluster.html#cluster_cluster_fork_env

func `on`*[T](self: Worker; event: cstring; callback: T) {.importjs: "#.on(#, #)", discardable.}

template onDisconnect*(self: Worker; callback) =
  ## Alias for `httpServer.on(event = cstring("disconnect"), callback)`.
  self.`on`("disconnect".cstring, callback)

template onError*(self: Worker; callback) =
  ## Alias for `httpServer.on(event = cstring("error"), callback)`.
  self.`on`("error".cstring, callback)

template onExit*(self: Worker; callback) =
  ## Alias for `httpServer.on(event = cstring("exit"), callback)`.
  self.`on`("exit".cstring, callback)

template onListening*(self: Worker; callback) =
  ## Alias for `httpServer.on(event = cstring("listening"), callback)`.
  self.`on`("listening".cstring, callback)

template onMessage*(self: Worker; callback) =
  ## Alias for `httpServer.on(event = cstring("message"), callback)`.
  self.`on`("message".cstring, callback)

template onOnline*(self: Worker; callback) =
  ## Alias for `httpServer.on(event = cstring("online"), callback)`.
  self.`on`("online".cstring, callback)

template onSetup*(self: Worker; callback) =
  ## Alias for `httpServer.on(event = cstring("setup"), callback)`.
  self.`on`("setup".cstring, callback)

template onFork*(self: Worker; callback) =
  ## Alias for `httpServer.on(event = cstring("fork"), callback)`.
  self.`on`("fork".cstring, callback)

iterator clusterWorkers*(): Worker =
  let wrkrs {.importjs: "Array.from((cluster.Workers || []))".}: seq[Worker]
  for workero in wrkrs:
    yield workero

func isPrimary*(): bool {.importjs: "(cluster.isPrimary)@".}

func isMaster*(): bool {.importjs: "(cluster.isPrimary)@".}

func isWorker*(): bool {.importjs: "(cluster.isWorker)@".}
