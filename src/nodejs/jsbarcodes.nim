## - Barcode and QR Code detection and parsing for JavaScript targets.
##
## .. warning:: Experimental JavaScript API, we hope browsers support it someday, untested because it wont work at the time of writing it, and is not widely used yet.
when not defined(js):
  {.fatal: "Module jsbarcodes is designed to be used with the JavaScript backend.".}
import std/[asyncjs, dom, jsffi]

type
  BarcodeDetector* = ref object of JsRoot ## https://developer.mozilla.org/en-US/docs/Web/API/BarcodeDetector/BarcodeDetector

  BarcodeDetectorFormats* = enum ## https://developer.mozilla.org/en-US/docs/Web/API/Barcode_Detection_API#supported_barcode_formats
    bdfAztec = "aztec".cstring            ## ISO-24778
    bdfCode128 = "code_128".cstring       ## ISO-15417
    bdfCode39 = "code_39".cstring         ## ISO-16388
    bdfCode93 = "code_93".cstring
    bdfCodabar = "codabar".cstring
    bdfDataMatrix = "data_matrix".cstring ## ISO-16022
    bdfEan13 = "ean_13".cstring           ## ISO-15420
    bdfEan_8 = "ean_8".cstring            ## ISO-15420
    bdfItf = "itf".cstring
    bdfPdf417 = "pdf417".cstring          ## ISO-15438
    bdfQrCode = "qr_code".cstring         ## ISO-18004
    bdfUpcA = "upc_a".cstring             ## ISO-15420
    bdfUpcE = "upc_e".cstring             ## ISO-15420
    bdfUnknown = "unknown".cstring

func newBarcodeDetector*(): BarcodeDetector {.importjs: "new BarcodeDetector()".}

func newBarcodeDetector*(formats: openArray[BarcodeDetectorFormats]): BarcodeDetector {.importjs: "new BarcodeDetector({formats: #})".}

func getSupportedFormats*(self: BarcodeDetector): seq[cstring] {.importjs: "#.$1()".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/BarcodeDetector/getSupportedFormats

func detect*(self: BarcodeDetector; imageBitmapSource: Node): Future[JsObject] {.importjs: "#.$1(#)".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/BarcodeDetector/detect
