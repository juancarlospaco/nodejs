## - Speech synthesis API for the browser.
## - https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis
## - Experimental, see https://caniuse.com/speech-synthesis
## - Live demo https://zenorocha.github.io/voice-elements

type SpeechSynthesis* = ref object of JsRoot  ## https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis
  paused*:   bool  ## https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/paused
  pending*:  bool  ## https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/pending
  speaking*: bool  ## https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/speaking

func newSpeechSynthesis*(): SpeechSynthesis {.importjs: "(window.speechSynthesis)@".}

func cancel*(self: SpeechSynthesis) {.importjs: "#.$1()", discardable.}
  ## https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/cancel

func pause*(self: SpeechSynthesis) {.importjs: "#.$1()", discardable.}
  ## https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/pause

func resume*(self: SpeechSynthesis) {.importjs: "#.$1()", discardable.}
  ## https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/resume

func speak*(self: SpeechSynthesis; text: cstring) {.importjs: "#.$1( (new SpeechSynthesisUtterance(#)) )", discardable.}
  ## https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/speak

func speak*(self: SpeechSynthesis; text, lang: cstring; volume: 0.1 .. 1.0; pitch: 0.0 .. 2.0; rate: 0.1 .. 10.0) {.importjs: """
const speechsynts = #;
const text2speak  = (new SpeechSynthesisUtterance(#));
text2speak.lang   = #;
text2speak.volume = #;
text2speak.pitch  = #;
text2speak.rate   = #;
speechsynts.speak(text2speak); """.}
  ## https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/speak

func speak*(self: SpeechSynthesis; text, lang: cstring; pitch: 0 .. 2; rate: 0 .. 10) {.importjs: """
const speechsynts = #;
const text2speak  = (new SpeechSynthesisUtterance(#));
text2speak.lang   = #;
text2speak.pitch  = #;
text2speak.rate   = #;
speechsynts.speak(text2speak); """.}
  ## https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/speak

func speak*(self: SpeechSynthesis; text, lang: cstring) {.importjs: """
const speechsynts = #;
const text2speak  = (new SpeechSynthesisUtterance(#));
text2speak.lang   = #;
speechsynts.speak(text2speak); """.}
  ## https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/speak
