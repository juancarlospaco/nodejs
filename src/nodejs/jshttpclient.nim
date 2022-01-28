## * HttpClient for JavaScript targets implemented as sugar on top of `fusion/js/jsxmlhttprequest <https://nim-lang.github.io/fusion/src/fusion/js/jsxmlhttprequest>`_
when not defined(js):
  {.fatal: "Module jshttpclient is designed to be used with the JavaScript backend.".}

import fusion/js/jsxmlhttprequest
from std/uri import Uri

type JsHttpClient* = XMLHttpRequest

func newJsHttpClient*(): JsHttpClient {.importjs: "new XMLHttpRequest()".}

proc xmlHttpRequestImpl(self: JsHttpClient; url: Uri | string; body: string; `method`: static[cstring]): cstring =
  self.open(`method` = `method`, url = cstring($url), false)
  self.send(body = body.cstring)
  self.responseText

proc getContent*(self: JsHttpClient; url: Uri | string): cstring =
  xmlHttpRequestImpl(self, url, "", "GET".cstring)

proc deleteContent*(self: JsHttpClient; url: Uri | string): cstring =
  xmlHttpRequestImpl(self, url, "", "DELETE".cstring)

proc postContent*(self: JsHttpClient; url: Uri | string; body = ""): cstring =
  xmlHttpRequestImpl(self, url, body, "POST".cstring)

proc putContent*(self: JsHttpClient; url: Uri | string; body = ""): cstring =
  xmlHttpRequestImpl(self, url, body, "PUT".cstring)

proc patchContent*(self: JsHttpClient; url: Uri | string; body = ""): cstring =
  xmlHttpRequestImpl(self, url, body, "PATCH".cstring)

proc head*(self: JsHttpClient; url: Uri | string): cstring =
  xmlHttpRequestImpl(self, url, "", "HEAD".cstring)


runnableExamples("-r:off"):
  from std/uri import parseUri, Uri

  let client = newJsHttpClient()
  const data = """{"key": "value"}"""

  block:
    let url = parseUri("http://nim-lang.org")
    let content = client.getContent(url)

  block:
    let url = parseUri("http://httpbin.org/delete")
    let content = client.deleteContent(url)

  block:
    let url = parseUri("http://httpbin.org/post")
    let content = client.postContent(url, data)

  block:
    let url = parseUri("http://httpbin.org/put")
    let content = client.putContent(url, data)

  block:
    let url = parseUri("http://httpbin.org/patch")
    let content = client.patchContent(url, data)
