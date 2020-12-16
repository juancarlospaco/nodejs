
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

func lookup*(hostname: cstring; callback: proc) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_lookup_hostname_options_callback

func lookupService*(address: cstring; port: cint; callback: proc) {.importjs: "dns.$1(#, #, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_lookupservice_address_port_callback

func resolve*(hostname: cstring; rrtype: cstring; callback: proc) {.importjs: "dns.$1(#, #, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolve_hostname_rrtype_callback

func resolve*(hostname: cstring; callback: proc) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolve_hostname_rrtype_callback

func resolve4*(hostname: cstring; callback: proc) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolve4_hostname_options_callback

func resolve6*(hostname: cstring; callback: proc) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolve6_hostname_options_callback

func resolveAny*(hostname: cstring; callback: proc) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolveany_hostname_callback

func resolveCname*(hostname: cstring; callback: proc) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvecname_hostname_callback

func resolveCaa*(hostname: cstring; callback: proc) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvecaa_hostname_callback

func resolveMx*(hostname: cstring; callback: proc) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvemx_hostname_callback

func resolveNaptr*(hostname: cstring; callback: proc) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvenaptr_hostname_callback

func resolveNs*(hostname: cstring; callback: proc) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvens_hostname_callback

func resolvePtr*(hostname: cstring; callback: proc) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolveptr_hostname_callback

func resolveSoa*(hostname: cstring; callback: proc) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvesoa_hostname_callback

func resolveSrv*(hostname: cstring; callback: proc) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvesrv_hostname_callback

func resolveTxt*(hostname: cstring; callback: proc) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvetxt_hostname_callback

func reverse*(ip: cstring; callback: proc) {.importjs: "dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_reverse_ip_callback

func setServers*(servers: openArray[cstring]) {.importjs: "dns.$1(#)".}
  ## https://nodejs.org/api/dns.html#dns_dns_setservers_servers
