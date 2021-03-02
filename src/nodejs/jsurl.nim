import std/jsffi

type
  URL* = ref object of JsRoot ## https://nodejs.org/api/url.html#url_class_url
    hash*, host*, hostname*, href*, origin*, password*, pathname*, port*, protocol*, search*, searchParams*, username*: cstring

  URLSearchParams* = ref object of JsRoot ## https://nodejs.org/api/url.html#url_class_urlsearchparams

func importUrl*() {.importjs: "import * as url from 'url'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireUrl*() {.importjs: "const url = require('url')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func newURL*(input: cstring): URL {.importjs: "(new URL(#))".}
func newURL*(input: cstring; base: cstring or URL): URL {.importjs: "(new URL(#, #))".}

func newURLSearchParams*(input: cstring or JsObject or openArray[cstring]): URLSearchParams {.importjs: "(new URLSearchParams(#))".}
  ## https://nodejs.org/api/url.html#url_new_urlsearchparams

func toJSON*(self: URL): cstring {.importjs: "#.toJSON()".}
  ## https://nodejs.org/api/url.html#url_url_tojson

func format*(self: URL; options: JsObject): cstring {.importjs: "url.$1(#)".}
  ## https://nodejs.org/api/url.html#url_url_format_url_options

func urlToHttpOptions*(self: URL): JsObject {.importjs: "url.$1(#)".}
  ## https://nodejs.org/api/url.html#url_url_urltohttpoptions_url

func add*(self: URLSearchParams; name: cstring, value: cstring) {.importjs: "#.append(#, #)".}
  ## https://nodejs.org/api/url.html#url_urlsearchparams_append_name_value

func delete*(self: URLSearchParams; name: cstring) {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/url.html#url_urlsearchparams_delete_name

func get*(self: URLSearchParams; name: cstring): cstring {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/url.html#url_urlsearchparams_get_name

func getAll*(self: URLSearchParams; name: cstring): seq[cstring] {.importjs: "#.$1(#)".}
  ## https://nodejs.org/api/url.html#url_urlsearchparams_getall_name

func hasKey*(self: URLSearchParams; name: cstring): bool {.importjs: "#.has(#)".}
  ## https://nodejs.org/api/url.html#url_urlsearchparams_has_name

func keys*(self: URLSearchParams): seq[cstring] {.importjs: "Array.from(#.$1())".}
  ## https://nodejs.org/api/url.html#url_urlsearchparams_keys

func values*(self: URLSearchParams): seq[cstring] {.importjs: "Array.from(#.$1())".}
  ## https://nodejs.org/api/url.html#url_urlsearchparams_values

func sets*(self: URLSearchParams; name: cstring, value: cstring) {.importjs: "#.set(#, #)".}
  ## https://nodejs.org/api/url.html#url_urlsearchparams_set_name_value

func sort*(self: URLSearchParams) {.importjs: "#.$1()".}
  ## https://nodejs.org/api/url.html#url_urlsearchparams_sort

func toCstring*(self: URL or URLSearchParams): cstring {.importjs: "#.toString()".}
  ## https://nodejs.org/api/url.html#url_url_tostring
  ## https://nodejs.org/api/url.html#url_urlsearchparams_tostring

func `$`*(self: URL or URLSearchParams): string = $toCstring(self)

func len*(self: URL): int = len($toCstring(self))

func domainToASCII*(domain: cstring): cstring {.importjs: "url.$1(#)".}
  ## https://nodejs.org/api/url.html#url_url_domaintoascii_domain

func domainToUnicode*(domain: cstring): cstring {.importjs: "url.$1(#)".}
  ## https://nodejs.org/api/url.html#url_url_domaintounicode_domain

func fileURLToPath*(domain: cstring or URL): cstring {.importjs: "url.$1(#)".}
  ## https://nodejs.org/api/url.html#url_url_fileurltopath_url


runnableExamples:
  requireUrl()
  block:
    let u: URL = newURL("https://user:pass@sub.example.com:8080/p/a/t/h?query=string#hash".cstring)
    doAssert u.toCstring is cstring
    doAssert u.len == 64
    # echo u.toJSON
  block:
    let para: URLSearchParams = newURLSearchParams("?user=abc&query=xyz".cstring)
    doAssert para.toCstring is cstring
    para.add "key".cstring, "value".cstring
    para.sort()
    doAssert para.hasKey "key".cstring
    doAssert para.keys == @["key".cstring, "query", "user"]
    doAssert para.values == @["value".cstring, "xyz", "abc"]
    doAssert para.get("key".cstring) == "value".cstring
    doAssert para.getAll("key".cstring) == @["value".cstring]
    doAssert $para == "key=value&query=xyz&user=abc"
    para.delete "key".cstring
  block:
    doAssert domainToASCII("中文.com".cstring) == "xn--fiq228c.com".cstring
    doAssert domainToUnicode("xn--fiq228c.com".cstring) == "中文.com".cstring
    when defined(linux):
      doAssert fileURLToPath("file:///C:/path/".cstring) == "/C:/path/".cstring
