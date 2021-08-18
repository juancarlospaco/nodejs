## Payments API.
## * https://github.com/w3c/payment-request-info/wiki/FAQ
##
## .. warning:: Experimental JavaScript API, we hope browsers support it soon, untested because is not widely used at the time of writing it.
when not defined(js):
  {.fatal: "Module jspayments is designed to be used with the JavaScript backend.".}

import std/[jsffi, asyncjs]

type
  PaymentRequest* = ref object of JsRoot ## https://developer.mozilla.org/en-US/docs/Web/API/Payment_Request_API
    shippingAddress*: JsObject ## https://developer.mozilla.org/en-US/docs/Web/API/PaymentRequest/shippingAddress
    shippingOption*: JsObject  ## https://developer.mozilla.org/en-US/docs/Web/API/PaymentRequest/shippingOption

  PaymentResponse* = ref object of JsRoot  ## https://developer.mozilla.org/en-US/docs/Web/API/PaymentResponse
    details*: JsObject         ## https://developer.mozilla.org/en-US/docs/Web/API/PaymentResponse/details
    methodName*: cstring       ## https://developer.mozilla.org/en-US/docs/Web/API/PaymentResponse/methodName
    payerEmail*: cstring       ## https://developer.mozilla.org/en-US/docs/Web/API/PaymentResponse/payerEmail
    payerName*: cstring       ## https://developer.mozilla.org/en-US/docs/Web/API/PaymentResponse/payerName
    payerPhone*: cstring       ## https://developer.mozilla.org/en-US/docs/Web/API/PaymentResponse/payerPhone
    requestId*: cstring        ## https://developer.mozilla.org/en-US/docs/Web/API/PaymentResponse/requestId
    shippingAddress*: JsObject ## https://developer.mozilla.org/en-US/docs/Web/API/PaymentResponse/shippingAddress
    shippingOption*: JsObject  ## https://developer.mozilla.org/en-US/docs/Web/API/PaymentRequest/shippingOption

func newPaymentRequest*(methodData, details, options: JsObject): PaymentRequest {.importjs: "new PaymentRequest(#, #, #)".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/Payment_Request_API

func newPaymentRequest*(methodData, details: JsObject): PaymentRequest {.importjs: "new PaymentRequest(#, #)".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/Payment_Request_API

func canMakePayment*(self: PaymentRequest): Future[bool] {.importjs: "#.$1()".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/PaymentRequest/canMakePayment

func show*(self: PaymentRequest): Future[PaymentResponse] {.importjs: "#.$1()".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/PaymentRequest/show

func retry*(self: PaymentRequest | PaymentResponse): Future[PaymentResponse] {.importjs: "#.$1()".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/PaymentResponse/retry

func complete*(self: PaymentRequest | PaymentResponse): Future[void] {.importjs: "#.$1()".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/PaymentResponse/complete

func complete*(self: PaymentRequest | PaymentResponse; results: cstring): Future[void] {.importjs: "#.$1(#)".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/PaymentResponse/complete
