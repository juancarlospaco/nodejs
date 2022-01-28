## * HttpClient for JavaScript targets implemented as sugar on top of `jsxmlhttprequest` and `std/jsfetch`.
when not defined(js):
  {.fatal: "Module jshttpclient is designed to be used with the JavaScript backend.".}

import
  std/[asyncjs, jsheaders, jsfetch, httpcore],
  nodejs/[jsxmlhttprequest, jsmultisync]
from std/uri import Uri

type
  JsHttpClient* = XMLHttpRequest
  JsAsyncHttpClient* = ref object of JsRoot

  JsRequest* = ref object of JsRoot
    `method`*: HttpMethod
    url*, body*, integrity*, referrer*: cstring
    referrerPolicy*: FetchReferrerPolicies
    mode*: FetchModes
    credentials*: FetchCredentials
    cache*: FetchCaches
    redirect*: FetchRedirects
    headers*: Headers
    keepAlive*: bool

  JsResponse* = ref object of JsRoot
    status*: cint
    statusText*, url*, responseText*: cstring
    headers*: Headers

func newJsHttpClient*(): JsHttpClient {.importjs: "new XMLHttpRequest()".}

func newJsAsyncHttpClient*(): JsAsyncHttpClient = discard

func newJsRequest*(url: cstring; `method`: HttpMethod; body, integrity, referrer: cstring = "";
  referrerPolicy: FetchReferrerPolicies = frpOrigin; mode: FetchModes = fmCors;
  credentials: FetchCredentials = fcInclude; cache: FetchCaches = fchDefault;
  redirect: FetchRedirects = frFollow; headers: Headers = newHeaders(); keepAlive: bool = false): JsRequest =
  result = JsRequest(
    url: url, `method`: `method`, integrity: integrity, referrer: referrer, mode: mode,
    credentials: credentials, cache: cache, redirect: redirect, referrerPolicy: referrerPolicy,
    headers: headers, keepAlive: keepAlive
  )
  if body != "":
    result.body = body

func fetchOptionsImpl(request: JsRequest): FetchOptions =
  newfetchOptions(
    metod = request.`method`, body = request.body, mode = request.mode, credentials = request.credentials,
    cache = request.cache, referrerPolicy = request.referrerPolicy, keepalive = request.keepAlive,
    redirect = request.redirect, referrer = request.referrer, integrity = request.integrity
  )

func setHeaders(client: JsHttpClient, request: JsRequest) =
  ## Sets Headers for `JsHttpClient`
  client.setRequestHeader([("Cache-Control".cstring, cstring($request.cache)),
    ("Referrer-Policy".cstring, cstring($request.referrerPolicy))])
  for pair in request.headers.entries():
    client.setRequestHeader(pair[0], pair[1])

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
  client.open(metod = cstring($request.`method`), url = request.url, async = true)
  client.setHeaders(request)
  if request.body == "".cstring:
    client.send()
  else:
    client.send(body = request.body)
  return client.response()

proc request*(client: JsAsyncHttpClient; request: JsRequest): Future[JsResponse] {.async.} =
  ## Request proc for async `jsfetch` client
  var req: Request = newRequest(request.url)
  req.headers = request.headers
  return response(await fetch(req, fetchOptionsImpl(request)))

proc head*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string; headers: Headers = newHeaders()): Future[JsResponse] {.multisync.} =
  let request = newJsRequest(url = cstring($url), `method` = HttpHead, headers = headers)
  return await client.request(request)

proc get*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string; headers: Headers = newHeaders()): Future[JsResponse] {.multisync.} =
  let request = newJsRequest(url = cstring($url), `method` = HttpGet, headers = headers)
  return await client.request(request)

proc getContent*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string; headers: Headers = newHeaders()): Future[cstring] {.multisync.} =
  let
    request = newJsRequest(url = cstring($url), `method` = HttpGet, headers = headers)
    resp = await client.request(request)
  return resp.responseText

proc delete*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string; headers: Headers = newHeaders()): Future[JsResponse] {.multisync.} =
  let request = newJsRequest(url = cstring($url), `method` = HttpDelete, headers = headers)
  return await client.request(request)

proc deleteContent*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string; body: cstring = ""; headers: Headers = newHeaders()): Future[cstring] {.multisync.} =
  let
    request = newJsRequest(url = cstring($url), `method` = HttpDelete, body = body, headers = headers)
    resp = await client.request(request)
  return resp.responseText

proc post*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string; headers: Headers = newHeaders()): Future[JsResponse] {.multisync.} =
  let request = newJsRequest(url = cstring($url), `method` = HttpPost, headers = headers)
  return await client.request(request)

proc postContent*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string; body: cstring = ""; headers: Headers = newHeaders()): Future[cstring] {.multisync.} =
  let
    request = newJsRequest(url = cstring($url), `method` = HttpPost, body = body, headers = headers)
    resp = await client.request(request)
  return resp.responseText

proc put*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string; headers: Headers = newHeaders()): Future[JsResponse] {.multisync.} =
  let request = newJsRequest(url = cstring($url), `method` = HttpPut, headers = headers)
  return await client.request(request)

proc putContent*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string; body: cstring = ""; headers: Headers = newHeaders()): Future[cstring] {.multisync.} =
  let
    request = newJsRequest(url = cstring($url), `method` = HttpPut, body = body, headers = headers)
    resp = await client.request(request)
  return resp.responseText

proc patch*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string; headers: Headers = newHeaders()): Future[JsResponse] {.multisync.} =
  let request = newJsRequest(url = cstring($url), `method` = HttpPatch, headers = headers)
  return await client.request(request)

proc patchContent*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string; body: cstring = ""; headers: Headers = newHeaders()): Future[cstring] {.multisync.} =
  let
    request = newJsRequest(url = cstring($url), `method` = HttpPatch, body = body, headers = headers)
    resp = await client.request(request)
  return resp.responseText

when isMainModule:
  # Use with nimhttpd, see https://github.com/juancarlospaco/nodejs/issues/5

  let
    client: JsHttpClient = newJsHttpClient()
    syncContent: cstring = client.getContent("http://0.0.0.0:1337/")
    asyncClient: JsAsyncHttpClient = newJsAsyncHttpClient()
    asyncContent: Future[cstring] = asyncClient.getContent("http://0.0.0.0:1337/")

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
