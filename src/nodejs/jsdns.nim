
func importNodeDns*() {.importjs: "import * as node_dns from 'dns'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireNodeDns*() {.importjs: "const node_dns = require('dns')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func lookup*(hostname: cstring; callback: proc) {.importjs: "node_dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_lookup_hostname_options_callback

func lookupService*(address: cstring; port: cint; callback: proc) {.importjs: "node_dns.$1(#, #, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_lookupservice_address_port_callback

func resolve*(hostname: cstring; rrtype: cstring; callback: proc) {.importjs: "node_dns.$1(#, #, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolve_hostname_rrtype_callback

func resolve*(hostname: cstring; callback: proc) {.importjs: "node_dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolve_hostname_rrtype_callback

func resolve4*(hostname: cstring; callback: proc) {.importjs: "node_dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolve4_hostname_options_callback

func resolve6*(hostname: cstring; callback: proc) {.importjs: "node_dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolve6_hostname_options_callback

func resolveAny*(hostname: cstring; callback: proc) {.importjs: "node_dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolveany_hostname_callback

func resolveCname*(hostname: cstring; callback: proc) {.importjs: "node_dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvecname_hostname_callback

func resolveCaa*(hostname: cstring; callback: proc) {.importjs: "node_dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvecaa_hostname_callback

func resolveMx*(hostname: cstring; callback: proc) {.importjs: "node_dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvemx_hostname_callback

func resolveNaptr*(hostname: cstring; callback: proc) {.importjs: "node_dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvenaptr_hostname_callback

func resolveNs*(hostname: cstring; callback: proc) {.importjs: "node_dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvens_hostname_callback

func resolvePtr*(hostname: cstring; callback: proc) {.importjs: "node_dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolveptr_hostname_callback

func resolveSoa*(hostname: cstring; callback: proc) {.importjs: "node_dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvesoa_hostname_callback

func resolveSrv*(hostname: cstring; callback: proc) {.importjs: "node_dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvesrv_hostname_callback

func resolveTxt*(hostname: cstring; callback: proc) {.importjs: "node_dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_resolvetxt_hostname_callback

func reverse*(ip: cstring; callback: proc) {.importjs: "node_dns.$1(#, #)".}
  ## https://nodejs.org/api/dns.html#dns_dns_reverse_ip_callback

func setServers*(servers: openArray[cstring]) {.importjs: "node_dns.$1(#)".}
  ## https://nodejs.org/api/dns.html#dns_dns_setservers_servers
