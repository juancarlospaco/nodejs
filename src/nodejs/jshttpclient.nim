## * HttpClient for JavaScript targets implemented as sugar on top of `jsxmlhttprequest` and `std/jsfetch`.
when not defined(js):
  {.fatal: "Module jshttpclient is designed to be used with the JavaScript backend.".}

import std/[asyncjs, jsheaders, jsfetch]
import jsxmlhttprequest
from std/uri import Uri

type
  JsHttpClient* = XMLHttpRequest
  JsAsyncHttpClient* = ref object of JsRoot

  JsRequest* = ref object of JsRoot
    url*, `method`*, body*, integrity*, referrer*, mode*, credentials*, cache*, redirect*,
    referrerPolicy*: cstring
    headers*: Headers
    keepAlive*: bool

  JsResponse* = ref object of JsRoot
    status*: cint
    statusText*, url*, responseText*: cstring
    headers*: Headers

func newJsHttpClient*(): JsHttpClient {.importjs: "new XMLHttpRequest()".}

func newJsAsyncHttpClient*(): JsAsyncHttpClient = discard

func newJsRequest*(url, `method`: cstring; body, integrity: cstring = "";
  referrer: cstring = "client"; mode: cstring = "cors"; credentials: cstring = "include";
  cache: cstring = "default"; redirect: cstring = "follow"; referrerPolicy: cstring = "unsafe-url";
  headers: Headers = newHeaders(); keepAlive: bool = false): JsRequest =
  result = JsRequest(
    url: url, `method`: `method`, body: body, integrity: integrity, referrer: referrer, mode: mode,
    credentials: credentials, cache: cache, redirect: redirect, referrerPolicy: referrerPolicy,
    headers: headers, keepAlive: keepAlive
  )

func fetchOptionsImpl(request: JsRequest): FetchOptions =
  unsafeNewFetchOptions(
    metod = request.`method`,
    body = request.body,
    mode = request.mode,
    credentials = request.credentials,
    cache = request.cache,
    referrerPolicy = request.referrerPolicy,
    keepAlive = request.keepAlive
  )

func response(response: XMLHttpRequest): JsResponse =
  ## Converts `XMLHttpRequest` to `JsResponse`
  new(result)
  result.status = response.status
  result.responseText = response.responseText

proc response(response: Response): JsResponse {.async.} =
  ## Converts `jsfetch` `Response` to `JsResponse`
  new(result)
  result.status = response.status
  result.statusText = response.statusText
  result.responseText = await text(response)
  result.url = response.url
  result.headers = response.headers

proc request*(client: JsHttpClient; request: JsRequest): JsResponse =
  ## Request proc for sync `XMLHttpRequest` client
  client.open(metod = request.`method`, url = request.url, async = false)
  client.send(body = request.body)
  return client.response()

proc request*(client: JsAsyncHttpClient; request: JsRequest): Future[JsResponse] {.async.} =
  ## Request proc for async `jsfetch` client
  return response(await fetch(request.url, fetchOptionsImpl(request)))

proc head*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string): Future[JsResponse] {.multisync.} =
  let request = newJsRequest(url = cstring($url), `method` = "HEAD")
  return await client.request(request)

proc get*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string): Future[JsResponse] {.multisync.} =
  let request = newJsRequest(url = cstring($url), `method` = "GET")
  return await client.request(request)

proc getContent*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string): Future[JsResponse] {.multisync.} =
  let request = newJsRequest(url = cstring($url), `method` = "GET")
  return await client.request(request)

proc delete*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string): Future[JsResponse] {.multisync.} =
  let request = newJsRequest(url = cstring($url), `method` = "DELETE")
  return await client.request(request)

proc deleteContent*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string; body: cstring = ""): Future[JsResponse] {.multisync.} =
  let request = newJsRequest(url = cstring($url), `method` = "DELETE", body = body)
  return await client.request(request)

proc post*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string): Future[JsResponse] {.multisync.} =
  let request = newJsRequest(url = cstring($url), `method` = "POST")
  return await client.request(request)

proc postContent*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string; body: cstring = ""): Future[JsResponse] {.multisync.} =
  let request = newJsRequest(url = cstring($url), `method` = "POST", body = body)
  return await client.request(request)

proc put*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string): Future[JsResponse] {.multisync.} =
  let request = newJsRequest(url = cstring($url), `method` = "PUT")
  return await client.request(request)

proc putContent*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string; body: cstring = ""): Future[JsResponse] {.multisync.} =
  let request = newJsRequest(url = cstring($url), `method` = "PUT", body = body)
  return await client.request(request)

proc patch*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string): Future[JsResponse] {.multisync.} =
  let request = newJsRequest(url = cstring($url), `method` = "PATCH")
  return await client.request(request)

proc patchContent*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string; body: cstring = ""): Future[JsResponse] {.multisync.} =
  let request = newJsRequest(url = cstring($url), `method` = "PATCH", body = body)
  return await client.request(request)

when isMainModule:
  # Use with nimhttpd, see https://github.com/juancarlospaco/nodejs/issues/5
  import std/jsconsole

  let
    client: JsHttpClient = newJsHttpClient()
    content: cstring = client.getContent("http://localhost:1337")

  console.log content

runnableExamples("-r:off"):
  from std/uri import parseUri

  let client: JsHttpClient = newJsHttpClient()
  const data: cstring = """{"key": "value"}"""

  block:
    let
      url: Uri = parseUri("https://google.com")
      content: JsResponse = client.getContent(url)

  block:
    let
      url: Uri = parseUri("https://httpbin.org/delete")
      content: JsResponse = client.deleteContent(url)

  block:
    let
      url: Uri = parseUri("https://httpbin.org/post")
      content: JsResponse = client.postContent(url, data)

  block:
    let
      url: Uri = parseUri("https://httpbin.org/put")
      content: JsResponse = client.putContent(url, data)

  block:
    let
      url: Uri = parseUri("https://httpbin.org/patch")
      content: JsResponse = client.patchContent(url, data)

runnableExamples("-d:nimExperimentalJsfetch -d:nimExperimentalAsyncjsThen -r:off"):
  import std/asyncjs

  proc example(): Future[void] {.async.} =
    let client = newJsAsyncHttpClient()
    const data = """{"key": "value"}"""

    block:
      let
        url: Uri = parseUri("http://nim-lang.org")
        content: JsResponse = await client.getContent(url)
        response: JsResponse = await client.get(url)

    block:
      let
        url: Uri = parseUri("http://httpbin.org/delete")
        content: JsResponse = await client.deleteContent(url)
        response: JsResponse = await client.delete(url)

    block:
      let
        url: Uri = parseUri("http://httpbin.org/post")
        content: JsResponse = await client.postContent(url, data)
        response: JsResponse = await client.post(url, data)

    block:
      let
        url: Uri = parseUri("http://httpbin.org/put")
        content: JsResponse = await client.putContent(url, data)
        response: JsResponse = await client.put(url, data)

    block:
      let
        url: Uri = parseUri("http://httpbin.org/patch")
        content: JsResponse = await client.patchContent(url, data)
        response: JsResponse = await client.patch(url, data)

  discard example()
