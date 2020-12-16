# NodeJS Standard Library for Nim

![](https://img.shields.io/github/languages/top/juancarlospaco/nodejs?style=for-the-badge)
![](https://img.shields.io/github/stars/juancarlospaco/nodejs?style=for-the-badge)
![](https://img.shields.io/maintenance/yes/2020?style=for-the-badge "2020")
![](https://img.shields.io/github/languages/code-size/juancarlospaco/nodejs?style=for-the-badge)
![](https://img.shields.io/github/issues-raw/juancarlospaco/nodejs?style=for-the-badge "Bugs")
![](https://img.shields.io/github/issues-pr-raw/juancarlospaco/nodejs?style=for-the-badge "PRs")
![](https://img.shields.io/github/last-commit/juancarlospaco/nodejs?style=for-the-badge "Commits")

- Code [NodeJS](https://nodejs.org) Apps using [Nim](http://nim-lang.org)
- Test [Nim](http://nim-lang.org) [Frontend projects](https://github.com/pragmagic/karax) using [NodeJS](https://nodejs.org)
- Use [NodeJS](https://nodejs.org) libraries with [Nim](http://nim-lang.org)
- [Replace TypeScript with Nim on your company.](https://github.com/nim-lang/Nim/wiki/Nim-for-TypeScript-Programmers#table-of-contents)
- [Run Nim generated WebAssembly using V8.](https://github.com/nim-lang/Nim/wiki/Nim-for-TypeScript-Programmers#WebAssembly)
- Future Proof: `0` Dependencies, does NOT use Nim standard library.


# Install

- `nimble install nodejs` OR `nimble install https://github.com/juancarlospaco/nodejs.git`


# Examples

```nim
import nodejs
```

# Efficiency

- is it any good ?, improves something ?.

```nim
import jsconsole, nodejs
console.log base64encode("example")
```

Generated JavaScript:

```javascript
console.log(Buffer.from("example", "utf-8").toString("base64"));
```

---

```nim
import jsconsole, base64  # Standard Library Base64
console.log base64encode("example")
```

<details>
  <summary>Standard Library Generated JavaScript</summary>
```javascript
function mnewString(len_33558512) {
    return new Array(len_33558512);
}
function makeNimstrLit(c_33558354) {
    var ln = c_33558354.length;
    var result = new Array(ln);
    for (var i = 0; i < ln; ++i) {
        result[i] = c_33558354.charCodeAt(i);
    }
    return result;
}
function toJSStr(s_33558362) {
    var Tmp5;
    var Tmp7;
    var result_33558363 = null;
    var res_33558422 = newSeq_33558393((s_33558362).length);
    var i_33558424 = 0;
    var j_33558426 = 0;
    L1: do {
        L2: while (true) {
            if (!(i_33558424 < (s_33558362).length)) break L2;
            var c_33558427 = s_33558362[i_33558424];
            if ((c_33558427 < 128)) {
                res_33558422[j_33558426] = String.fromCharCode(c_33558427);
                i_33558424 += 1;
            } else {
                var helper_33558450 = newSeq_33558393(0);
                L3: do {
                    L4: while (true) {
                        if (!true) break L4;
                        var code_33558451 = c_33558427.toString(16);
                        if (((code_33558451).length == 1)) {
                            helper_33558450.push("%0");;
                        } else {
                            helper_33558450.push("%");;
                        }
                        helper_33558450.push(code_33558451);;
                        i_33558424 += 1;
                        if (((s_33558362).length <= i_33558424)) Tmp5 = true;
                        else {
                            Tmp5 = (s_33558362[i_33558424] < 128);
                        }
                        if (Tmp5) {
                            break L3;
                        }
                        c_33558427 = s_33558362[i_33558424];
                    }
                } while (false);
                ++excHandler;
                Tmp7 = framePtr;
                try {
                    res_33558422[j_33558426] = decodeURIComponent(helper_33558450.join(""));
                    --excHandler;
                } catch (EXC) {
                    var prevJSError = lastJSError;
                    lastJSError = EXC;
                    --excHandler;
                    framePtr = Tmp7;
                    res_33558422[j_33558426] = helper_33558450.join("");
                    lastJSError = prevJSError;
                } finally {
                    framePtr = Tmp7;
                }
            }
            j_33558426 += 1;
        }
    } while (false);
    if (res_33558422.length < j_33558426) {
        for (var i = res_33558422.length; i < j_33558426; ++i) res_33558422.push(null);
    } else {
        res_33558422.length = j_33558426;
    };
    result_33558363 = res_33558422.join("");
    return result_33558363;
}
var globalRaiseHook_33557677 = [null];
if (globalThis.localRaiseHook_33557682 === undefined) {
    localRaiseHook_33557682 = [null];
}
var outOfMemHook_33557685 = [null];
var unhandledExceptionHook_33557690 = [null];
var cb64_469762056 = [65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 43, 47];
var cb64safe_469762059 = [65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 45, 95];
function encode_469762156(s_469762158, safe_469762159) {
    var Tmp2;
    var result_469762160 = [];
    L1: do {
        if (safe_469762159) {
            Tmp2 = cb64safe_469762059;
        } else {
            Tmp2 = cb64_469762056;
        }
        var lookupTable_469762502 = Tmp2;
        (result_469762160.length = (Math.trunc(((s_469762158).length * 4) / 3) + 6));
        var inputIndexHEX60gensym45_469762513 = 0;
        var outputIndexHEX60gensym45_469762515 = 0;
        var inputEndsHEX60gensym45_469762516 = ((s_469762158).length - Math.trunc((s_469762158).length % 3));
        var nHEX60gensym45_469762517 = 0;
        var bHEX60gensym45_469762518 = 0;
        L3: do {
            L4: while (true) {
                if (!!((inputIndexHEX60gensym45_469762513 == inputEndsHEX60gensym45_469762516))) break L4;
                bHEX60gensym45_469762518 = s_469762158[inputIndexHEX60gensym45_469762513];
                nHEX60gensym45_469762517 = (bHEX60gensym45_469762518 << 16);
                inputIndexHEX60gensym45_469762513 += 1;
                bHEX60gensym45_469762518 = s_469762158[inputIndexHEX60gensym45_469762513];
                nHEX60gensym45_469762517 = (nHEX60gensym45_469762517 | (bHEX60gensym45_469762518 << 8));
                inputIndexHEX60gensym45_469762513 += 1;
                bHEX60gensym45_469762518 = s_469762158[inputIndexHEX60gensym45_469762513];
                nHEX60gensym45_469762517 = (nHEX60gensym45_469762517 | (bHEX60gensym45_469762518 << 0));
                inputIndexHEX60gensym45_469762513 += 1;
                result_469762160[outputIndexHEX60gensym45_469762515] = lookupTable_469762502[(((nHEX60gensym45_469762517 >>> 0) >>> 18) & 63)];
                outputIndexHEX60gensym45_469762515 += 1;
                result_469762160[outputIndexHEX60gensym45_469762515] = lookupTable_469762502[(((nHEX60gensym45_469762517 >>> 0) >>> 12) & 63)];
                outputIndexHEX60gensym45_469762515 += 1;
                result_469762160[outputIndexHEX60gensym45_469762515] = lookupTable_469762502[(((nHEX60gensym45_469762517 >>> 0) >>> 6) & 63)];
                outputIndexHEX60gensym45_469762515 += 1;
                result_469762160[outputIndexHEX60gensym45_469762515] = lookupTable_469762502[(((nHEX60gensym45_469762517 >>> 0) >>> 0) & 63)];
                outputIndexHEX60gensym45_469762515 += 1;
            }
        } while (false);
        var paddingHEX60gensym45_469762646 = Math.trunc((s_469762158).length % 3);
        if ((paddingHEX60gensym45_469762646 == 1)) {
            bHEX60gensym45_469762518 = s_469762158[inputIndexHEX60gensym45_469762513];
            nHEX60gensym45_469762517 = (bHEX60gensym45_469762518 << 16);
            inputIndexHEX60gensym45_469762513 += 1;
            result_469762160[outputIndexHEX60gensym45_469762515] = lookupTable_469762502[(((nHEX60gensym45_469762517 >>> 0) >>> 18) & 63)];
            outputIndexHEX60gensym45_469762515 += 1;
            result_469762160[outputIndexHEX60gensym45_469762515] = lookupTable_469762502[(((nHEX60gensym45_469762517 >>> 0) >>> 12) & 63)];
            outputIndexHEX60gensym45_469762515 += 1;
            result_469762160[outputIndexHEX60gensym45_469762515] = 61;
            outputIndexHEX60gensym45_469762515 += 1;
            result_469762160[outputIndexHEX60gensym45_469762515] = 61;
            outputIndexHEX60gensym45_469762515 += 1;
        } else {
            if ((paddingHEX60gensym45_469762646 == 2)) {
                bHEX60gensym45_469762518 = s_469762158[inputIndexHEX60gensym45_469762513];
                nHEX60gensym45_469762517 = (bHEX60gensym45_469762518 << 16);
                inputIndexHEX60gensym45_469762513 += 1;
                bHEX60gensym45_469762518 = s_469762158[inputIndexHEX60gensym45_469762513];
                nHEX60gensym45_469762517 = (nHEX60gensym45_469762517 | (bHEX60gensym45_469762518 << 8));
                inputIndexHEX60gensym45_469762513 += 1;
                result_469762160[outputIndexHEX60gensym45_469762515] = lookupTable_469762502[(((nHEX60gensym45_469762517 >>> 0) >>> 18) & 63)];
                outputIndexHEX60gensym45_469762515 += 1;
                result_469762160[outputIndexHEX60gensym45_469762515] = lookupTable_469762502[(((nHEX60gensym45_469762517 >>> 0) >>> 12) & 63)];
                outputIndexHEX60gensym45_469762515 += 1;
                result_469762160[outputIndexHEX60gensym45_469762515] = lookupTable_469762502[(((nHEX60gensym45_469762517 >>> 0) >>> 6) & 63)];
                outputIndexHEX60gensym45_469762515 += 1;
                result_469762160[outputIndexHEX60gensym45_469762515] = 61;
                outputIndexHEX60gensym45_469762515 += 1;
            }
        }
        (result_469762160.length = outputIndexHEX60gensym45_469762515);
    } while (false);
    return result_469762160;
}
function newSeq_33558393(len_33558396) {
    var result_33558398 = [];
    result_33558398 = new Array(len_33558396);
    for (var i = 0; i < len_33558396; ++i) {
        result_33558398[i] = null;
    }
    return result_33558398;
}

console.log(toJSStr(encode_469762156(makeNimstrLit("example"), false)));
```
</details>


# Stars

![](https://starchart.cc/juancarlospaco/nodejs.svg)
