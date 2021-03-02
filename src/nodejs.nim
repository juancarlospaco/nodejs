when not defined(js) and not defined(nimdoc):
  {.fatal: "Module NodeJS is designed to be used with the JavaScript backend.".}

when defined(js) and not defined(nodejs):
  {.warning: "Module NodeJS is designed to be used with the NodeJS.".}

import
  nodejs/jscore,
  nodejs/jsassert,
  nodejs/jsasynchooks,
  nodejs/jsdns,
  nodejs/jsfs,
  nodejs/jsinspector,
  nodejs/jsv8,
  nodejs/jsos,
  nodejs/jspath,
  nodejs/jsperfhooks,
  nodejs/jsprocess,
  nodejs/jspunycode,
  nodejs/jsquerystring,
  nodejs/jsutils,
  nodejs/jszlib,
  nodejs/jsreadline,
  nodejs/jstimers,
  nodejs/jsrepl,
  nodejs/jsurl,
  nodejs/jstracing,
  nodejs/jsmodule,
  nodejs/jsdomain,
  nodejs/jsugar

export
  jscore,
  jsassert,
  jsasynchooks,
  jsdns,
  jsfs,
  jsinspector,
  jsv8,
  jsos,
  jspath,
  jsperfhooks,
  jsprocess,
  jspunycode,
  jsquerystring,
  jsutils,
  jszlib,
  jsreadline,
  jstimers,
  jsrepl,
  jsurl,
  jstracing,
  jsmodule,
  jsdomain,
  jsugar
