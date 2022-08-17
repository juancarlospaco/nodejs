## - File system IO API for the browser. Works only over HTTPS (not localhost).
## - https://developer.mozilla.org/en-US/docs/Web/API/File_System_Access_API
## - Experimental, see https://caniuse.com/mdn-api_filesystem

import std/asyncjs
from std/jsffi import JsObject

type
  FileSystemHandle* = ref object of JsRoot           ##  https://developer.mozilla.org/en-US/docs/Web/API/FileSystemHandle
    kind*: cstring  # kind is 'file' or 'directory', read-only cstring. https://developer.mozilla.org/en-US/docs/Web/API/FileSystemHandle/kind
    name*: cstring  # name is the file name path, read-only cstring.    https://developer.mozilla.org/en-US/docs/Web/API/FileSystemHandle/name

  FileSystemDirectoryHandle* = ref object of JsRoot  ## https://developer.mozilla.org/en-US/docs/Web/API/FileSystemDirectoryHandle
    kind*: cstring  # kind is 'file' or 'directory', read-only cstring. https://developer.mozilla.org/en-US/docs/Web/API/FileSystemHandle/kind
    name*: cstring  # name is the file name path, read-only cstring.    https://developer.mozilla.org/en-US/docs/Web/API/FileSystemHandle/name

func isSameEntry*(self, fileSystemHandle: FileSystemHandle or FileSystemDirectoryHandle): bool {.importjs: "(#.$1(#) || false)".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/FileSystemHandle/isSameEntry

func queryPermission*(self: FileSystemHandle or FileSystemDirectoryHandle): cstring {.importjs: "(#.$1() || 'denied')".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/FileSystemHandle/queryPermission

func queryPermission*(self: FileSystemHandle or FileSystemDirectoryHandle; fileSystemHandlePermissionDescriptor: JsObject): cstring {.importjs: "(#.$1(#) || 'denied')".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/FileSystemHandle/queryPermission

func requestPermission*(self: FileSystemHandle or FileSystemDirectoryHandle): cstring {.importjs: "(#.$1() || 'denied')".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/FileSystemHandle/requestPermission

func requestPermission*(self: FileSystemHandle or FileSystemDirectoryHandle; fileSystemHandlePermissionDescriptor: JsObject): cstring {.importjs: "(#.$1(#) || 'denied')".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/FileSystemHandle/requestPermission

func showOpenFilePicker*(): Future[seq[FileSystemHandle]] {.importjs: "window.$1()".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/window/showOpenFilePicker

func showOpenFilePicker*(options: JsObject): Future[seq[FileSystemHandle]] {.importjs: "window.$1(#)".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/window/showOpenFilePicker

func showSaveFilePicker*(): Future[FileSystemHandle] {.importjs: "window.$1()".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/window/showSaveFilePicker

func showSaveFilePicker*(options: JsObject): Future[FileSystemHandle] {.importjs: "window.$1(#)".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/window/showSaveFilePicker

func showDirectoryPicker*(): FileSystemHandle {.importjs: "window.$1()".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/window/showDirectoryPicker

func showDirectoryPicker*(options: JsObject): FileSystemHandle {.importjs: "window.$1(#)".}
  ## https://developer.mozilla.org/en-US/docs/Web/API/window/showDirectoryPicker
