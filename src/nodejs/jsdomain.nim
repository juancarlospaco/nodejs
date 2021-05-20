from std/jsffi import JsObject

type
  Domain* = ref object of JsRoot ## https://nodejs.org/api/domain.html#domain_class_domain
    members*: seq[JsObject]      ## https://nodejs.org/api/domain.html#domain_domain_members

func importDomain*() {.importjs: "import * as domain from 'domain'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireDomain*() {.importjs: "const domain = require('domain')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func newDomain*(): Domain {.importjs: "domain.create()".}
  ## https://nodejs.org/api/domain.html#domain_domain_create

func add*(self: Domain; emitter: auto) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/domain.html#domain_domain_add_emitter

func remove*(self: Domain; emitter: auto) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/domain.html#domain_domain_remove_emitter

func binds*[T](self: Domain; callback: T): T {.importjs: "#.bind(#)".}
  ## https://nodejs.org/api/domain.html#domain_domain_bind_callback

func intercept*[T](self: Domain; callback: T): T {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/domain.html#domain_domain_intercept_callback

func enter*(self: Domain) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/domain.html#domain_domain_enter

func exit*(self: Domain) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/domain.html#domain_domain_exit

func run*[T](self: Domain; fn: T; args: auto) {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/domain.html#domain_domain_run_fn_args
