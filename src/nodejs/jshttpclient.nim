## * HttpClient for JavaScript targets implemented as sugar on top of `fusion/js/jsxmlhttprequest <https://nim-lang.github.io/fusion/src/fusion/js/jsxmlhttprequest>`_
when not defined(js):
  {.fatal: "Module jsttpclient is designed to be used with the JavaScript backend.".}

import fusion/js/jsxmlhttprequest

type JsHttpClient* = ref object of XMLHttpRequest

func newJsHttpClient*(): JsHttpClient = discard

proc xmlHttpRequestImpl(self: JsHttpClient; url: string or cstring; body: string or cstring; metod: static[cstring]): cstring =
  self.open(metod = metod, url = cstring(url), false)
  self.send(body = body.cstring)
  self.responseText

proc getContent*(self: JsHttpClient; url: string or cstring): cstring =
  xmlHttpRequestImpl(self, url, "", "GET".cstring)

proc deleteContent*(self: JsHttpClient; url: string or cstring): cstring =
  xmlHttpRequestImpl(self, url, "", "DELETE".cstring)

proc postContent*(self: JsHttpClient; url: string or cstring; body: string or cstring = ""): cstring =
  xmlHttpRequestImpl(self, url, body, "POST".cstring)

proc putContent*(self: JsHttpClient; url: string or cstring; body: string or cstring = ""): cstring =
  xmlHttpRequestImpl(self, url, body, "PUT".cstring)

proc patchContent*(self: JsHttpClient; url: string or cstring; body: string or cstring = ""): cstring =
  xmlHttpRequestImpl(self, url, body, "PATCH".cstring)

proc head*(self: JsHttpClient; url: string or cstring): cstring =
  xmlHttpRequestImpl(self, url, "", "HEAD".cstring)


runnableExamples("-r:off"):
  import fusion/js/jsxmlhttprequest
  let client = newJsHttpClient()
  const data = """{"key": "value"}"""
  echo client.getContent("http://nim-lang.org")
  echo client.deleteContent("http://httpbin.org/delete")
  echo client.postContent("http://httpbin.org/post", data)
  echo client.putContent("http://httpbin.org/put", data)
  echo client.patchContent("http://httpbin.org/patch", data)
