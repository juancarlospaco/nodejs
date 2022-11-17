## Canvas API for JavaScript targets. https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D
from std/dom import Node

type
  CanvasRenderingContext2D* = ref object of JsRoot  ## https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D
    direction*, fillStyle*, font*, fontKerning*, fontStretch*, fontVariantCaps*, globalCompositeOperation*, imageSmoothingQuality*: cstring
    letterSpacing*, lineCap*, lineJoin*, shadowColor*, strokeStyle*, textAlign*, textBaseline*, textRendering*, wordSpacing*: cstring
    lineDashOffset*, lineWidth*, miterLimit*, shadowBlur*, shadowOffsetX*, shadowOffsetY*: float
    imageSmoothingEnabled*: bool
    globalAlpha*: 0.0 .. 1.0
    width*  {.importc: "canvas.width" .}:  int
    height* {.importc: "canvas.height".}: int

  ImageData* = ref object of JsRoot
    data*: seq[byte]
    width*, height*: int

  Image* = ref object of JsRoot
    height*, width*: int
    src*:      cstring
    complete*: bool

{.push importcpp.}

func arc*(self: CanvasRenderingContext2D; x, y: SomeNumber; radius: Positive; startAngle, endAngle: SomeNumber; counterclockwise = false)

func arcTo*(self: CanvasRenderingContext2D; x1, y1, x2, y2: SomeNumber; radius: Positive)

func beginPath*(self: CanvasRenderingContext2D)

func bezierCurveTo*(self: CanvasRenderingContext2D; cp1x, cp1y, cp2x, cp2y, x, y: SomeNumber)

func clearRect*(self: CanvasRenderingContext2D; x, y, width, height: SomeNumber)

func clip*(self: CanvasRenderingContext2D)

func closePath*(self: CanvasRenderingContext2D)

func drawFocusIfNeeded*(self: CanvasRenderingContext2D; element: Node)

func drawImage*(self: CanvasRenderingContext2D; image: Image or Node; dx, dy: SomeNumber)

func drawImage*(self: CanvasRenderingContext2D; image: Image or Node; dx, dy, dWidth, dHeight: SomeNumber)

func drawImage*(self: CanvasRenderingContext2D; image: Image or Node; sx, sy, sWidth, sHeight, dx, dy, dWidth, dHeight: SomeNumber)

func ellipse*(self: CanvasRenderingContext2D; x, y, radiusX, radiusY, rotation, startAngle, endAngle: SomeNumber; counterclockwise = false)

func fill*(self: CanvasRenderingContext2D)

func fillRect*(self: CanvasRenderingContext2D; x, y, width, height: SomeNumber)

func fillText*(self: CanvasRenderingContext2D; text: cstring; x, y: SomeNumber)

func fillText*(self: CanvasRenderingContext2D; text: cstring; x, y: SomeNumber; maxWidth: Positive)

func getLineDash*(self: CanvasRenderingContext2D): seq[int]

func isContextLost*(self: CanvasRenderingContext2D): bool

func isPointInPath*(self: CanvasRenderingContext2D; x, y: SomeNumber; fillRule: cstring): bool

func isPointInPath*(self: CanvasRenderingContext2D; x, y: SomeNumber): bool

func isPointInStroke*(self: CanvasRenderingContext2D; x, y: SomeNumber): bool

func lineTo*(self: CanvasRenderingContext2D;x, y: SomeNumber)

func moveTo*(self: CanvasRenderingContext2D;x, y: SomeNumber)

func quadraticCurveTo*(self: CanvasRenderingContext2D; cpx, cpy, x, y: SomeNumber)

func rect*(self: CanvasRenderingContext2D; x, y, width, height: SomeNumber)

func reset*(self: CanvasRenderingContext2D)

func resetTransform*(self: CanvasRenderingContext2D)

func restore*(self: CanvasRenderingContext2D)

func rotate*(self: CanvasRenderingContext2D; angle: SomeNumber)

func roundRect*(self: CanvasRenderingContext2D; x, y, width, height: SomeNumber; radii: SomeNumber)

func roundRect*(self: CanvasRenderingContext2D; x, y, width, height: SomeNumber; radii: array[1, int])

func roundRect*(self: CanvasRenderingContext2D; x, y, width, height: SomeNumber; radii: array[2, int])

func roundRect*(self: CanvasRenderingContext2D; x, y, width, height: SomeNumber; radii: array[3, int])

func roundRect*(self: CanvasRenderingContext2D; x, y, width, height: SomeNumber; radii: array[4, int])

func save*(self: CanvasRenderingContext2D)

func scale*(self: CanvasRenderingContext2D; x, y: SomeNumber)

func scrollPathIntoView*(self: CanvasRenderingContext2D)

func setLineDash*(self: CanvasRenderingContext2D; segments: seq[int])

func setTransform*(self: CanvasRenderingContext2D; a, b, c, d, e, f: SomeNumber)

func stroke*(self: CanvasRenderingContext2D)

func strokeRect*(self: CanvasRenderingContext2D; x, y, width, height: SomeNumber)

func strokeText*(self: CanvasRenderingContext2D; text: cstring; x, y: SomeNumber)

func strokeText*(self: CanvasRenderingContext2D; text: cstring; x, y: SomeNumber; maxWidth: Positive)

func transform*(self: CanvasRenderingContext2D; a, b, c, d, e, f: SomeNumber)

func translate*(self: CanvasRenderingContext2D; x, y: SomeNumber)

func createImageData*(self: CanvasRenderingContext2D; width, height: SomeNumber): ImageData

func putImageData*(self: CanvasRenderingContext2D; image: ImageData; dx, dy: SomeNumber)

func getContext*(self: Node; contextType: cstring): CanvasRenderingContext2D

# https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/fillStyle#webkitblink-specific_note
func setFillColor*(self: CanvasRenderingContext2D; color, alpha: SomeNumber or cstring)

func setFillColor*(self: CanvasRenderingContext2D; color: SomeNumber or cstring)

func setFillColor*(self: CanvasRenderingContext2D; r, g, b, a: SomeNumber or cstring)

func setFillColor*(self: CanvasRenderingContext2D; c, m, y, k, a: SomeNumber or cstring)

{.pop.}

func newImage*(): Image {.importjs: "(new Image())@".}

func getPixelRatio*(): float {.importjs: """(() => {
const ctx = document.createElement("canvas").getContext("2d");
return ((window.devicePixelRatio || 1.0) / (ctx.webkitBackingStorePixelRatio || ctx.mozBackingStorePixelRatio || ctx.msBackingStorePixelRatio || ctx.backingStorePixelRatio || 1.0)) || 1.0;
})(@)""".}
