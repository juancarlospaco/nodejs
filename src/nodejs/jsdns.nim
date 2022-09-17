type Resolver* = ref object of JsRoot ## https://nodejs.org/api/dns.html#dns_class_dns_resolver

let
  NODATA* {.importjs: "dns.NODATA".}: cstring
  FORMERR* {.importjs: "dns.FORMERR".}: cstring
  SERVFAIL* {.importjs: "dns.SERVFAIL".}: cstring
  NOTFOUND* {.importjs: "dns.NOTFOUND".}: cstring
  NOTIMP* {.importjs: "dns.NOTIMP".}: cstring
  REFUSED* {.importjs: "dns.REFUSED".}: cstring
  BADQUERY* {.importjs: "dns.BADQUERY".}: cstring
  BADNAME* {.importjs: "dns.BADNAME".}: cstring
  BADFAMILY* {.importjs: "dns.BADFAMILY".}: cstring
  BADRESP* {.importjs: "dns.BADRESP".}: cstring
  CONNREFUSED* {.importjs: "dns.CONNREFUSED".}: cstring
  TIMEOUT* {.importjs: "dns.TIMEOUT".}: cstring
  FILE* {.importjs: "dns.FILE".}: cstring
  NOMEM* {.importjs: "dns.NOMEM".}: cstring
  DESTRUCTION* {.importjs: "dns.DESTRUCTION".}: cstring
  BADSTR* {.importjs: "dns.BADSTR".}: cstring
  BADFLAGS* {.importjs: "dns.BADFLAGS".}: cstring
  NONAME* {.importjs: "dns.NONAME".}: cstring
  BADHINTS* {.importjs: "dns.BADHINTS".}: cstring
  NOTINITIALIZED* {.importjs: "dns.NOTINITIALIZED".}: cstring
  LOADIPHLPAPI* {.importjs: "dns.LOADIPHLPAPI".}: cstring
  ADDRGETNETWORKPARAMS* {.importjs: "dns.ADDRGETNETWORKPARAMS".}: cstring
  CANCELLED* {.importjs: "dns.CANCELLED".}: cstring

func importDns*() {.importjs: "import * as dns from 'dns'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireDns*() {.importjs: "const dns = require('dns')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func newResolver*(timeout = -1.cint): Resolver {.importjs: "(new Resolver({timeout: #}))".}

func cancel*(self: Resolver) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/dns.html#dns_resolver_cancel

func setLocalAddress*(self: Resolver; ipv4: cstring) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/dns.html#dns_resolver_setlocaladdress_ipv4_ipv6

func setLocalAddress*(self: Resolver; ipv4: cstring; ipv6: cstring) {.importjs: "#.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_resolver_setlocaladdress_ipv4_ipv6

func getServers*(self: Resolver): seq[cstring] {.importjs: "(#.$1() || [])".}

func resolve*[T](self: Resolver; hostname: cstring; callback: T) {.importjs: "#.$1(#, #)".}

func resolve*[T](self: Resolver; hostname: cstring; rrtype: cstring; callback: T) {.importjs: "#.$1(#, #, #)".}

func resolve4*[T](self: Resolver; hostname: cstring; callback: T) {.importjs: "#.$1(#, #)".}

func resolve4*[T](self: Resolver; hostname: cstring; ttl: bool; callback: T) {.importjs: "#.$1(#, {ttl: #}, #)".}

func resolve6*[T](self: Resolver; hostname: cstring; callback: T) {.importjs: "#.$1(#, #)".}

func resolve6*[T](self: Resolver; hostname: cstring; ttl: bool; callback: T) {.importjs: "#.$1(#, {ttl: #}, #)".}

func resolveAny*[T](self: Resolver; hostname: cstring; callback: T) {.importjs: "#.$1(#, #)".}

func resolveCname*[T](self: Resolver; hostname: cstring; callback: T) {.importjs: "#.$1(#, #)".}

func resolveCaa*[T](self: Resolver; hostname: cstring; callback: T) {.importjs: "#.$1(#, #)".}

func resolveMx*[T](self: Resolver; hostname: cstring; callback: T) {.importjs: "#.$1(#, #)".}

func resolveNaptr*[T](self: Resolver; hostname: cstring; callback: T) {.importjs: "#.$1(#, #)".}

func resolveNs*[T](self: Resolver; hostname: cstring; callback: T) {.importjs: "#.$1(#, #)".}

func resolvePtr*[T](self: Resolver; hostname: cstring; callback: T) {.importjs: "#.$1(#, #)".}

func resolveSoa*[T](self: Resolver; hostname: cstring; callback: T) {.importjs: "#.$1(#, #)".}

func resolveSrv*[T](self: Resolver; hostname: cstring; callback: T) {.importjs: "#.$1(#, #)".}

func resolveTxt*[T](self: Resolver; hostname: cstring; callback: T) {.importjs: "#.$1(#, #)".}

func reverse*[T](self: Resolver; ip: cstring; callback: T) {.importjs: "#.$1(#, #)".}

func setServers*[T](self: Resolver; servers: openArray[cstring]) {.importjs: "#.$1(#)".}

func lookup*[T](hostname: cstring; callback: T) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_lookup_hostname_options_callback

func lookupService*[T](address: cstring; port: cint; callback: T) {.importjs: "dns.$1(#, #, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_lookupservice_address_port_callback

func resolve*[T](hostname: cstring; rrtype: cstring; callback: T) {.importjs: "dns.$1(#, #, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolve_hostname_rrtype_callback

func resolve*[T](hostname: cstring; callback: T) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolve_hostname_rrtype_callback

func resolve4*[T](hostname: cstring; callback: T) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolve4_hostname_options_callback

func resolve6*[T](hostname: cstring; callback: T) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolve6_hostname_options_callback

func resolveAny*[T](hostname: cstring; callback: T) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolveany_hostname_callback

func resolveCname*[T](hostname: cstring; callback: T) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvecname_hostname_callback

func resolveCaa*[T](hostname: cstring; callback: T) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvecaa_hostname_callback

func resolveMx*[T](hostname: cstring; callback: T) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvemx_hostname_callback

func resolveNaptr*[T](hostname: cstring; callback: T) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvenaptr_hostname_callback

func resolveNs*[T](hostname: cstring; callback: T) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvens_hostname_callback

func resolvePtr*[T](hostname: cstring; callback: T) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolveptr_hostname_callback

func resolveSoa*[T](hostname: cstring; callback: T) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvesoa_hostname_callback

func resolveSrv*[T](hostname: cstring; callback: T) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvesrv_hostname_callback

func resolveTxt*[T](hostname: cstring; callback: T) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvetxt_hostname_callback

func reverse*[T](ip: cstring; callback: T) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_reverse_ip_callback

func setServers*(servers: openArray[cstring]) {.importjs: "dns.$1(#)".}
  ## https://nodejs.org/api/dns.html#dns_dns_setservers_servers
