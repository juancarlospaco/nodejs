## * HttpClient for JavaScript targets implemented as sugar on top of `fusion/js/jsxmlhttprequest <https://nim-lang.github.io/fusion/src/fusion/js/jsxmlhttprequest>`_
when not defined(js):
  {.fatal: "Module jssynchttpclient is designed to be used with the JavaScript backend.".}

import jsxmlhttprequest
from std/uri import Uri

type JsHttpClient* = XMLHttpRequest

func newJsHttpClient*(): JsHttpClient {.importjs: "new XMLHttpRequest()".}

proc xmlHttpRequestImpl(self: JsHttpClient; url: Uri | string; `method`: static[cstring]; body: cstring = ""): cstring =
  self.open(metod = `method`, url = cstring($url), false)
  self.send(body = body)
  self.responseText

proc getContent*(self: JsHttpClient; url: Uri | string): cstring =
  xmlHttpRequestImpl(self, url, "GET".cstring)

proc deleteContent*(self: JsHttpClient; url: Uri | string): cstring =
  xmlHttpRequestImpl(self, url, "DELETE".cstring)

proc postContent*(self: JsHttpClient; url: Uri | string; body: cstring = ""): cstring =
  xmlHttpRequestImpl(self, url, "POST".cstring, body)

proc putContent*(self: JsHttpClient; url: Uri | string; body: cstring = ""): cstring =
  xmlHttpRequestImpl(self, url, "PUT".cstring, body)

proc patchContent*(self: JsHttpClient; url: Uri | string; body: cstring = ""): cstring =
  xmlHttpRequestImpl(self, url, "PATCH".cstring, body)

proc head*(self: JsHttpClient; url: Uri | string): cstring =
  xmlHttpRequestImpl(self, url, "HEAD".cstring)


runnableExamples("-r:off"):
  from std/uri import parseUri, Uri

  let client = newJsHttpClient()
  const data = """{"key": "value"}"""

  block:
    let url = parseUri("https://google.com")
    let content = client.getContent(url)

  block:
    let url = parseUri("https://httpbin.org/delete")
    let content = client.deleteContent(url)

  block:
    let url = parseUri("https://httpbin.org/post")
    let content = client.postContent(url, data)

  block:
    let url = parseUri("https://httpbin.org/put")
    let content = client.putContent(url, data)

  block:
    let url = parseUri("https://httpbin.org/patch")
    let content = client.patchContent(url, data)


when isMainModule:
  # Use with nimhttpd, see https://github.com/juancarlospaco/nodejs/issues/5
  import std/jsconsole
  let client: JsHttpClient = newJsHttpClient()
  let content: cstring = client.getContent("http://localhost:1337")
  console.log content
