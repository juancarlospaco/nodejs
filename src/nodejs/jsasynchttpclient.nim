## * Async HttpClient for JavaScript targets implemented as sugar on top of `std/jsfetch <https://nim-lang.github.io/Nim/jsfetch>`_
when not defined(js):
  {.fatal: "Module jsasynchttpclient is designed to be used with the JavaScript backend.".}

import std/[jsfetch, asyncjs]
from std/uri import Uri

type JsAsyncHttpClient* = ref object of JsRoot

func newJsAsyncHttpClient*(): JsAsyncHttpClient = discard

func fetchOptionsImpl(`method`: static[cstring]; body: cstring = ""): FetchOptions =
  unsafeNewFetchOptions(metod = `method`, body = body, mode = "cors".cstring, credentials = "include".cstring,
    cache = "default".cstring, referrerPolicy = "unsafe-url".cstring, keepalive = false)

proc getContent*(self: JsAsyncHttpClient; url: Uri | string; fetchOptions = fetchOptionsImpl("GET".cstring)): Future[cstring] {.async.} =
  text(await fetch(cstring($url), fetchOptions))

proc deleteContent*(self: JsAsyncHttpClient; url: Uri | string; fetchOptions = fetchOptionsImpl("DELETE".cstring)): Future[cstring] {.async.} =
  text(await fetch(cstring($url), fetchOptions))

proc postContent*(self: JsAsyncHttpClient; url: Uri | string; fetchOptions = fetchOptionsImpl("POST".cstring)): Future[cstring] {.async.} =
  text(await fetch(cstring($url), fetchOptions))

proc putContent*(self: JsAsyncHttpClient; url: Uri | string; fetchOptions = fetchOptionsImpl("PUT".cstring)): Future[cstring] {.async.} =
  text(await fetch(cstring($url), fetchOptions))

proc patchContent*(self: JsAsyncHttpClient; url: Uri | string; fetchOptions = fetchOptionsImpl("PATCH".cstring)): Future[cstring] {.async.} =
  text(await fetch(cstring($url), fetchOptions))

proc get*(self: JsAsyncHttpClient; url: Uri | string; fetchOptions = fetchOptionsImpl("GET".cstring)): Future[Response] {.async.} =
  fetch(cstring($url), fetchOptions)

proc delete*(self: JsAsyncHttpClient; url: Uri | string; fetchOptions = fetchOptionsImpl("DELETE".cstring)): Future[Response] {.async.} =
  fetch(cstring($url), fetchOptions)

proc post*(self: JsAsyncHttpClient; url: Uri | string; fetchOptions = fetchOptionsImpl("POST".cstring)): Future[Response] {.async.} =
  fetch(cstring($url), fetchOptions)

proc put*(self: JsAsyncHttpClient; url: Uri | string; fetchOptions = fetchOptionsImpl("PUT".cstring)): Future[Response] {.async.} =
  fetch(cstring($url), fetchOptions)

proc patch*(self: JsAsyncHttpClient; url: Uri | string; fetchOptions = fetchOptionsImpl("PATCH".cstring)): Future[Response] {.async.} =
  fetch(cstring($url), fetchOptions)

proc head*(self: JsAsyncHttpClient; url: Uri | string; fetchOptions = fetchOptionsImpl("HEAD".cstring)): Future[Response] {.async.} =
  fetch(cstring($url), fetchOptions)


runnableExamples("-d:nimExperimentalJsfetch -d:nimExperimentalAsyncjsThen -r:off"):
  import std/[asyncjs, jsfetch, uri]

  proc example(): Future[void] {.async.} =
    let client = newJsAsyncHttpClient()
    const data = """{"key": "value"}"""

    block:
      let url = parseUri("http://nim-lang.org")
      let content = await client.getContent(url)
      let response = await client.get(url)

    block:
      let url = parseUri("http://httpbin.org/delete")
      let content = await client.deleteContent(url)
      let response = await client.delete(url)

    block:
      let url = parseUri("http://httpbin.org/post")
      let content = await client.postContent(url, data)
      let response = await client.post(url, data)

    block:
      let url = parseUri("http://httpbin.org/put")
      let content = await client.putContent(url, data)
      let response = await client.put(url, data)

    block:
      let url = parseUri("http://httpbin.org/patch")
      let content = await client.patchContent(url, data)
      let response = await client.patch(url, data)

  discard example()
