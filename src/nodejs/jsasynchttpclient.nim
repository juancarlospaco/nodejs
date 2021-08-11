## * Async HttpClient for JavaScript targets implemented as sugar on top of `std/jsfetch <https://nim-lang.github.io/Nim/jsfetch>`_
when not defined(js):
  {.fatal: "Module jsasynchttpclient is designed to be used with the JavaScript backend.".}

import std/[jsfetch, asyncjs]

type JsAsyncHttpClient* = ref object of JsRoot

func newJsAsyncHttpClient*(): JsAsyncHttpClient = discard

func fetchOptionsImpl(body: cstring; metod: static[cstring]): FetchOptions =
  unsafeNewFetchOptions(metod = metod, body = body, mode = "cors".cstring, credentials = "include".cstring,
    cache = "default".cstring, referrerPolicy = "unsafe-url".cstring, keepalive = false)

proc getContent*(self: JsAsyncHttpClient; url: string or cstring): Future[cstring] {.async.} =
  text(await fetch(cstring(url)))

proc deleteContent*(self: JsAsyncHttpClient; url: string or cstring): Future[cstring] {.async.} =
  text(await fetch(cstring(url), fetchOptionsImpl("".cstring, "DELETE".cstring)))

proc postContent*(self: JsAsyncHttpClient; url: string or cstring; body = ""): Future[cstring] {.async.} =
  text(await fetch(cstring(url), fetchOptionsImpl(body.cstring, "POST".cstring)))

proc putContent*(self: JsAsyncHttpClient; url: string or cstring; body = ""): Future[cstring] {.async.} =
  text(await fetch(cstring(url), fetchOptionsImpl(body.cstring, "PUT".cstring)))

proc patchContent*(self: JsAsyncHttpClient; url: string or cstring; body = ""): Future[cstring] {.async.} =
  text(await fetch(cstring(url), fetchOptionsImpl(body.cstring, "PATCH".cstring)))

proc get*(self: JsAsyncHttpClient; url: string or cstring): Future[Response] {.async.} =
  fetch(cstring(url))

proc delete*(self: JsAsyncHttpClient; url: string or cstring): Future[Response] {.async.} =
  fetch(cstring(url), fetchOptionsImpl("".cstring, "DELETE".cstring))

proc post*(self: JsAsyncHttpClient; url: string or cstring; body = ""): Future[Response] {.async.} =
  fetch(cstring(url), fetchOptionsImpl(body.cstring, "POST".cstring))

proc put*(self: JsAsyncHttpClient; url: string or cstring; body = ""): Future[Response] {.async.} =
  fetch(cstring(url), fetchOptionsImpl(body.cstring, "PUT".cstring))

proc patch*(self: JsAsyncHttpClient; url: string or cstring; body = ""): Future[Response] {.async.} =
  fetch(cstring(url), fetchOptionsImpl(body.cstring, "PATCH".cstring))

proc head*(self: JsAsyncHttpClient; url: string or cstring): Future[Response] {.async.} =
  fetch(cstring(url), fetchOptionsImpl("".cstring, "HEAD".cstring))


runnableExamples("-d:nimExperimentalJsfetch -d:nimExperimentalAsyncjsThen -r:off"):
  import std/[asyncjs, jsfetch, uri]

  proc example(): Future[void] {.async.} =
    let client = newJsAsyncHttpClient()
    const data = """{"key": "value"}"""

    block:
      let content = await client.getContent("http://nim-lang.org")
      let response = await client.get("http://nim-lang.org")

    block:
      let content = await client.deleteContent("http://httpbin.org/delete")
      let response = await client.delete("http://httpbin.org/delete")

    block:
      let content = await client.postContent("http://httpbin.org/post", data)
      let response = await client.post("http://httpbin.org/post", data)

    block:
      let content = await client.putContent("http://httpbin.org/put", data)
      let response = await client.put("http://httpbin.org/put", data)

    block:
      let content = await client.patchContent("http://httpbin.org/patch", data)
      let response = await client.patch("http://httpbin.org/patch", data)

  discard example()
