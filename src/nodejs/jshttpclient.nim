## * HttpClient for JavaScript targets implemented as sugar on top of `fusion/js/jsxmlhttprequest <https://nim-lang.github.io/fusion/src/fusion/js/jsxmlhttprequest>`_
when not defined(js):
  {.fatal: "Module jssynchttpclient is designed to be used with the JavaScript backend.".}

import jsxmlhttprequest
from std/uri import Uri

type JsHttpClient* = XMLHttpRequest

func newJsHttpClient*(): JsHttpClient {.importjs: "new XMLHttpRequest()".}

proc xmlHttpRequestImpl(self: JsHttpClient; url: Uri | string; metod: static[cstring]; body: cstring = ""): cstring =
  self.open(metod = metod, url = cstring($url), false)
  self.send(body = body)
  self.responseText

func getContent*(self: JsHttpClient; url: Uri | string): cstring =
  xmlHttpRequestImpl(self, url, "GET".cstring)

func deleteContent*(self: JsHttpClient; url: Uri | string): cstring =
  xmlHttpRequestImpl(self, url, "DELETE".cstring)

func postContent*(self: JsHttpClient; url: Uri | string; body: cstring = ""): cstring =
  xmlHttpRequestImpl(self, url, "POST".cstring, body)

func putContent*(self: JsHttpClient; url: Uri | string; body: cstring = ""): cstring =
  xmlHttpRequestImpl(self, url, "PUT".cstring, body)

func patchContent*(self: JsHttpClient; url: Uri | string; body: cstring = ""): cstring =
  xmlHttpRequestImpl(self, url, "PATCH".cstring, body)

func head*(self: JsHttpClient; url: Uri | string): cstring =
  xmlHttpRequestImpl(self, url, "HEAD".cstring)


runnableExamples("-r:off"):
  from std/uri import parseUri, Uri

  let client: JsHttpClient = newJsHttpClient()
  const data = """{"key": "value"}"""

  block:
    let url: Uri = parseUri("https://google.com")
    let content: cstring = client.getContent(url)

  block:
    let url: Uri = parseUri("https://httpbin.org/delete")
    let content: cstring = client.deleteContent(url)

  block:
    let url: Uri = parseUri("https://httpbin.org/post")
    let content: cstring = client.postContent(url, data)

  block:
    let url: Uri = parseUri("https://httpbin.org/put")
    let content: cstring = client.putContent(url, data)

  block:
    let url: Uri = parseUri("https://httpbin.org/patch")
    let content: cstring = client.patchContent(url, data)


when isMainModule:
  # Use with nimhttpd, see https://github.com/juancarlospaco/nodejs/issues/5
  import std/jsconsole
  let client: JsHttpClient = newJsHttpClient()
  let content: cstring = client.getContent("http://localhost:1337")
  console.log content
