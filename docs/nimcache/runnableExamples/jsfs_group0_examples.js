/* Generated by the Nim Compiler v1.5.1 */
var framePtr = null;
var excHandler = 0;
var lastJSError = null;

function toJSStr(s_33556810) {
                    var Temporary5;
            var Temporary7;

  var result_33556811 = null;

    var res_33556845 = newSeq_33556828((s_33556810).length);
    var i_33556846 = 0;
    var j_33556847 = 0;
    Label1: do {
        Label2: while (true) {
        if (!(i_33556846 < (s_33556810).length)) break Label2;
          var c_33556848 = s_33556810[i_33556846];
          if ((c_33556848 < 128)) {
          res_33556845[j_33556847] = String.fromCharCode(c_33556848);
          i_33556846 += 1;
          }
          else {
            var helper_33556860 = newSeq_33556828(0);
            Label3: do {
                Label4: while (true) {
                if (!true) break Label4;
                  var code_33556861 = c_33556848.toString(16);
                  if ((((code_33556861) == null ? 0 : (code_33556861).length) == 1)) {
                  helper_33556860.push("%0");;
                  }
                  else {
                  helper_33556860.push("%");;
                  }
                  
                  helper_33556860.push(code_33556861);;
                  i_33556846 += 1;
                    if (((s_33556810).length <= i_33556846)) Temporary5 = true; else {                      Temporary5 = (s_33556810[i_33556846] < 128);                    }                  if (Temporary5) {
                  break Label3;
                  }
                  
                  c_33556848 = s_33556810[i_33556846];
                }
            } while (false);
++excHandler;
            Temporary7 = framePtr;
            try {
            res_33556845[j_33556847] = decodeURIComponent(helper_33556860.join(""));
--excHandler;
} catch (EXCEPTION) {
 var prevJSError = lastJSError;
 lastJSError = EXCEPTION;
 --excHandler;
            framePtr = Temporary7;
            res_33556845[j_33556847] = helper_33556860.join("");
            lastJSError = prevJSError;
            } finally {
            framePtr = Temporary7;
            }
          }
          
          j_33556847 += 1;
        }
    } while (false);
    if (res_33556845.length < j_33556847) { for (var i = res_33556845.length ; i < j_33556847 ; ++i) res_33556845.push(null); }
               else { res_33556845.length = j_33556847; };
    result_33556811 = res_33556845.join("");

  return result_33556811;

}

function rawEcho() {
          var buf = "";
      for (var i = 0; i < arguments.length; ++i) {
        buf += toJSStr(arguments[i]);
      }
      console.log(buf);
    

  
}

function cstrToNimstr(c_33556807) {
      var ln = c_33556807.length;
  var result = new Array(ln);
  var r = 0;
  for (var i = 0; i < ln; ++i) {
    var ch = c_33556807.charCodeAt(i);

    if (ch < 128) {
      result[r] = ch;
    }
    else {
      if (ch < 2048) {
        result[r] = (ch >> 6) | 192;
      }
      else {
        if (ch < 55296 || ch >= 57344) {
          result[r] = (ch >> 12) | 224;
        }
        else {
            ++i;
            ch = 65536 + (((ch & 1023) << 10) | (c_33556807.charCodeAt(i) & 1023));
            result[r] = (ch >> 18) | 240;
            ++r;
            result[r] = ((ch >> 12) & 63) | 128;
        }
        ++r;
        result[r] = ((ch >> 6) & 63) | 128;
      }
      ++r;
      result[r] = (ch & 63) | 128;
    }
    ++r;
  }
  return result;
  

  
}
if (!Math.trunc) {
  Math.trunc = function(v) {
    v = +v;
    if (!isFinite(v)) return v;
    return (v - v % 1) || (v < 0 ? -0 : v === 0 ? v : 0);
  };
}

var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/src/nodejs/jsfs.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs_examples1", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/docs/nimcache/runnableExamples/jsfs_examples1.nim", line: 0};
framePtr = F;
framePtr = F.prev;

function newSeq_33556828(len_33556830) {
  var result_33556831 = [];

  var F = {procname: "newSeq.newSeq", prev: framePtr, filename: "/home/runner/.choosenim/toolchains/nim-#devel/lib/system.nim", line: 0};
  framePtr = F;
    F.line = 676;
    result_33556831 = new Array(len_33556830); for (var i = 0 ; i < len_33556830 ; ++i) { result_33556831[i] = null; }  framePtr = F.prev;

  return result_33556831;

}
var F = {procname: "module jsfs_examples1", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/docs/nimcache/runnableExamples/jsfs_examples1.nim", line: 0};
framePtr = F;
F.line = 7;
const fs = require('fs');
F.line = 8;
  (() => {
    const path = "touched.txt";
    const time = new Date();
    try {
      fs.utimesSync(path, time, time);
    } catch(err) {
      fs.closeSync(fs.openSync(path, 'w'));
    }
  })();
F.line = 9;
fs.writeFileSync("touched.txt", "data");
F.line = 10;
fs.appendFileSync("touched.txt", "\nmore data");
F.line = 11;
fs.renameSync("touched.txt", "renamed.txt");
F.line = 12;
fs.chmodSync("renamed.txt", 511);
F.line = 13;
fs.copyFileSync("renamed.txt", "copied.txt");
F.line = 14;
var data_520093698 = fs.readFileSync("renamed.txt").toString();
F.line = 15;
fs.rmSync("renamed.txt");
F.line = 16;
fs.rmSync("copied.txt");
F.line = 17;
rawEcho(cstrToNimstr(fs.mkdtempSync("test")));
framePtr = F.prev;
var F = {procname: "module jsfs_examples1", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/docs/nimcache/runnableExamples/jsfs_examples1.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs_examples1", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/docs/nimcache/runnableExamples/jsfs_examples1.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs_group0_examples", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/docs/nimcache/runnableExamples/jsfs_group0_examples.nim", line: 0};
framePtr = F;
framePtr = F.prev;
var F = {procname: "module jsfs_group0_examples", prev: framePtr, filename: "/home/runner/work/nodejs/nodejs/docs/nimcache/runnableExamples/jsfs_group0_examples.nim", line: 0};
framePtr = F;
framePtr = F.prev;
