
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
