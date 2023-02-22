## .. warning:: Experimental JavaScript API.
## * An HttpClient for JavaScript targets implemented as sugar on top of `jsxmlhttprequest` and `std/jsfetch`.
when not defined(js):
  {.fatal: "Module jshttpclient is designed to be used with the JavaScript backend.".}

import
  std/[asyncjs, jsheaders, httpcore, uri],
  jsfetch,
  jsxmlhttprequest,
  jsmultisync

type
  JsHttpClient* = ref object of JsRoot
    http*: XMLHttpRequest
    headers*: Headers
  JsAsyncHttpClient* = ref object of JsRoot
    headers*: Headers

  JsRequest* = ref object of JsRoot
    `method`*: HttpMethod
    url*, body*, integrity*, referrer*: cstring
    referrerPolicy*: FetchReferrerPolicies
    mode*: FetchModes
    credentials*: FetchCredentials
    cache*: FetchCaches
    redirect*: FetchRedirects
    keepAlive*: bool

  JsResponse* = ref object of JsRoot
    status*: HttpCode
    statusText*, url*, responseText*: cstring
    headers*: Headers

func newJsHttpClient*(headers: Headers = newHeaders()): JsHttpClient =
  return JsHttpClient(http: newXMLHttpRequest(), headers: headers)

func newJsAsyncHttpClient*(headers: Headers = newHeaders()): JsAsyncHttpClient =
  return JsAsyncHttpClient(headers: headers)

proc newJsRequest*(url: cstring; `method`: HttpMethod; body, integrity, referrer: cstring = "";
  referrerPolicy: FetchReferrerPolicies = frpOrigin; mode: FetchModes = fmCors;
  credentials: FetchCredentials = fcOmit; cache: FetchCaches = fchDefault;
  redirect: FetchRedirects = frFollow; keepAlive: bool = false): JsRequest =
  result = JsRequest(
    url: url, `method`: `method`, integrity: integrity, referrer: referrer, mode: mode,
    credentials: credentials, cache: cache, redirect: redirect, referrerPolicy: referrerPolicy,
    keepAlive: keepAlive
  )
  if body != "":
    result.body = body

template fetchOptionsImpl(request: JsRequest): FetchOptions =
  newfetchOptions(
    metod = request.`method`, body = request.body, mode = request.mode, credentials = request.credentials,
    cache = request.cache, referrerPolicy = request.referrerPolicy, keepalive = request.keepAlive,
    redirect = request.redirect, referrer = request.referrer, integrity = request.integrity
  )

proc setHeaders(client: JsHttpClient, request: JsRequest) =
  ## Sets Headers for `JsHttpClient`
  for (key, val) in client.headers.entries:
    client.http.setRequestHeader(key, val)

proc response(response: XMLHttpRequest): JsResponse =
  ## Converts `XMLHttpRequest` to `JsResponse`
  new(result)
  result.status = cast[HttpCode](response.status)
  result.responseText = response.responseText

proc response(response: Response, text: cstring): JsResponse {.async.} =
  ## Converts `jsfetch` `Response` to `JsResponse`
  new(result)
  result.status = cast[HttpCode](response.status)
  result.statusText = response.statusText
  result.responseText = text
  result.url = response.url
  result.headers = response.headers

proc request*(client: JsHttpClient; request: JsRequest): JsResponse =
  ## Request proc for sync `XMLHttpRequest` client
  client.http.open(metod = cstring($request.`method`), url = request.url, async = true)
  client.setHeaders(request)
  if request.body == "".cstring:
    client.http.send()
  else:
    client.http.send(body = request.body)
  return client.http.response()

proc request*(client: JsAsyncHttpClient; request: JsRequest): Future[JsResponse] {.async.} =
  ## Request proc for async `jsfetch` client
  var
    req: Request = newRequest(request.url)
    fetchOptions: FetchOptions = fetchOptionsImpl(request)
  fetchOptions.headers = client.headers
  let
    resp = await fetch(req, fetchOptions)
    text = await text(resp)
  return response(resp, text)

proc head*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string): Future[JsResponse] {.multisync.} =
  let request = newJsRequest(url = cstring($url), `method` = HttpHead)
  return await client.request(request)

proc get*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string): Future[JsResponse] {.multisync.} =
  let request = newJsRequest(url = cstring($url), `method` = HttpGet)
  return await client.request(request)

proc getContent*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string): Future[cstring] {.multisync.} =
  let
    request = newJsRequest(url = cstring($url), `method` = HttpGet)
    resp = await client.request(request)
  return resp.responseText

proc delete*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string): Future[JsResponse] {.multisync.} =
  let request = newJsRequest(url = cstring($url), `method` = HttpDelete)
  return await client.request(request)

proc deleteContent*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string): Future[cstring] {.multisync.} =
  let
    request = newJsRequest(url = cstring($url), `method` = HttpDelete)
    resp = await client.request(request)
  return resp.responseText

proc post*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string; body: cstring = ""): Future[JsResponse] {.multisync.} =
  let request = newJsRequest(url = cstring($url), `method` = HttpPost, body = body)
  return await client.request(request)

proc postContent*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string; body: cstring = ""): Future[cstring] {.multisync.} =
  let
    request = newJsRequest(url = cstring($url), `method` = HttpPost, body = body)
    resp = await client.request(request)
  return resp.responseText

proc put*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string; body: cstring = ""): Future[JsResponse] {.multisync.} =
  let request = newJsRequest(url = cstring($url), `method` = HttpPut, body = body)
  return await client.request(request)

proc putContent*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string; body: cstring = ""): Future[cstring] {.multisync.} =
  let
    request = newJsRequest(url = cstring($url), `method` = HttpPut, body = body)
    resp = await client.request(request)
  return resp.responseText

proc patch*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string; body: cstring = ""): Future[JsResponse] {.multisync.} =
  let request = newJsRequest(url = cstring($url), `method` = HttpPatch, body = body)
  return await client.request(request)

proc patchContent*(client: JsHttpClient | JsAsyncHttpClient; url: Uri | string; body: cstring = ""): Future[cstring] {.multisync.} =
  let
    request = newJsRequest(url = cstring($url), `method` = HttpPatch, body = body)
    resp = await client.request(request)
  return resp.responseText

proc close*(self: JsHttpClient or JsAsyncHttpClient) = discard


when isMainModule:
  # Use with nimhttpd, see https://github.com/juancarlospaco/nodejs/issues/5
  let
    client: JsHttpClient = newJsHttpClient()
    syncContent: cstring = client.getContent("http://0.0.0.0:1337/")
    asyncClient: JsAsyncHttpClient = newJsAsyncHttpClient()
    asyncContent: Future[cstring] = asyncClient.getContent("http://0.0.0.0:1337/")


runnableExamples("-r:off"):
  import std/uri

  let client: JsHttpClient = newJsHttpClient()
  const data: cstring = """{"key": "value"}"""

  block:
    let
      url: Uri = parseUri("https://google.com")
      content: cstring = client.getContent(url)

  block:
    let
      url: Uri = parseUri("https://httpbin.org/delete")
      content: cstring = client.deleteContent(url)

  block:
    let
      url: Uri = parseUri("https://httpbin.org/post")
      content: cstring = client.postContent(url, data)

  block:
    let
      url: Uri = parseUri("https://httpbin.org/put")
      content: cstring = client.putContent(url, data)

  block:
    let
      url: Uri = parseUri("https://httpbin.org/patch")
      content: cstring = client.patchContent(url, data)


runnableExamples("-d:nimExperimentalJsfetch -d:nimExperimentalAsyncjsThen -r:off"):
  import std/[asyncjs, uri]

  proc example(): Future[void] {.async.} =
    let client: JsAsyncHttpClient = newJsAsyncHttpClient()
    const data = """{"key": "value"}"""

    block:
      let
        url: Uri = parseUri("http://nim-lang.org")
        content: cstring = await client.getContent(url)
        response: JsResponse = await client.get(url)

    block:
      let
        url: Uri = parseUri("http://httpbin.org/delete")
        content: cstring = await client.deleteContent(url)
        response: JsResponse = await client.delete(url)

    block:
      let
        url: Uri = parseUri("http://httpbin.org/post")
        content: cstring = await client.postContent(url, data)
        response: JsResponse = await client.post(url, data)

    block:
      let
        url: Uri = parseUri("http://httpbin.org/put")
        content: cstring = await client.putContent(url, data)
        response: JsResponse = await client.put(url, data)

    block:
      let
        url: Uri = parseUri("http://httpbin.org/patch")
        content: cstring = await client.patchContent(url, data)
        response: JsResponse = await client.patch(url, data)

  discard example()
