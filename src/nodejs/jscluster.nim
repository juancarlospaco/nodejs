import std/jsffi

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

func disconnect*(self: Worker): Worker {.importjs: "#.$1()".}
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

func fork*(self: Cluster): Worker {.importjs: "#.$1()".}
  ## https://nodejs.org/api/cluster.html#cluster_cluster_fork_env

func setupPrimary*(self: Cluster; settings: JsObject) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/cluster.html#cluster_cluster_fork_env

func setupPrimary*(self: Cluster) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/cluster.html#cluster_cluster_fork_env

func setupMaster*(self: Cluster; settings: JsObject) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/cluster.html#cluster_cluster_fork_env

func setupMaster*(self: Cluster) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/cluster.html#cluster_cluster_fork_env
