## .. warning:: You MUST import `process` before importing this module. Uses `stdout` by default.

func importReadline*() {.importjs: "import * as readline from 'readline'@".}
  ## Alias for `import * as module_name from 'module_name';`. **Must be called once before using the module**

func requireReadline*() {.importjs: "const readline = require('readline')@".}
  ## Alias for `const module_name = require('module_name');`. **Must be called once before using the module**

func clearLine*(dir = 0.cint): bool {.importjs: "readline.$1(process.stout, #)".}
  ## https://nodejs.org/docs/latest/api/readline.html#readline_readline_clearline_stream_dir_callback

func clearScreenDown*(): bool {.importjs: "readline.$1(process.stout)".}
  ## https://nodejs.org/docs/latest/api/readline.html#readline_readline_clearscreendown_stream_callback

func cursorTo*(x, y: cint): bool {.importjs: "readline.$1(process.stout, #, #)".}
  ## https://nodejs.org/docs/latest/api/readline.html#readline_readline_cursorto_stream_x_y_callback

func moveCursor*(dx, dy: cint): bool {.importjs: "readline.$1(process.stout, #, #)".}
  ## https://nodejs.org/docs/latest/api/readline.html#readline_readline_movecursor_stream_dx_dy_callback
