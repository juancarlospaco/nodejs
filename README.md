# NodeJS Standard Library for Nim

![](https://img.shields.io/github/languages/top/juancarlospaco/nodejs?style=for-the-badge)
![](https://img.shields.io/github/stars/juancarlospaco/nodejs?style=for-the-badge)
![](https://img.shields.io/maintenance/yes/2020?style=for-the-badge "2020")
![](https://img.shields.io/github/languages/code-size/juancarlospaco/nodejs?style=for-the-badge)
![](https://img.shields.io/github/issues-raw/juancarlospaco/nodejs?style=for-the-badge "Bugs")
![](https://img.shields.io/github/issues-pr-raw/juancarlospaco/nodejs?style=for-the-badge "PRs")
![](https://img.shields.io/github/last-commit/juancarlospaco/nodejs?style=for-the-badge "Commits")
![](https://github.com/juancarlospaco/nodejs/workflows/Build/badge.svg?branch=main)

![](https://raw.githubusercontent.com/juancarlospaco/nodejs/main/nodenim.jpg)

Code [NodeJS](https://nodejs.org) using [Nim](http://nim-lang.org),
test [frontend projects](https://github.com/pragmagic/karax) using [NodeJS](https://nodejs.org),
use [NodeJS](https://nodejs.org) libraries with [Nim](http://nim-lang.org), etc.


# Modules supported

Documentation Index 1 page :arrow_right: https://juancarlospaco.github.io/nodejs

- :heavy_check_mark: [assert](https://nodejs.org/api/assert.html) :arrow_right: https://juancarlospaco.github.io/nodejs/nodejs/jsassert.html
- :heavy_check_mark: [async_hooks](https://nodejs.org/api/async_hooks.html) :arrow_right: https://juancarlospaco.github.io/nodejs/nodejs/jsasynchooks.html
- :heavy_check_mark: [process](https://nodejs.org/api/process.html) :arrow_right: https://juancarlospaco.github.io/nodejs/nodejs/jsprocess.html
- :heavy_check_mark: [dns](https://nodejs.org/api/dns.html) :arrow_right: https://juancarlospaco.github.io/nodejs/nodejs/jsdns.html
- :heavy_check_mark: [fs](https://nodejs.org/api/fs.html) :arrow_right: https://juancarlospaco.github.io/nodejs/nodejs/jsfs.html
- :heavy_check_mark: [inspector](https://nodejs.org/api/inspector.html) :arrow_right: https://juancarlospaco.github.io/nodejs/nodejs/jsinspector.html
- :heavy_check_mark: [os](https://nodejs.org/api/os.html) :arrow_right: https://juancarlospaco.github.io/nodejs/nodejs/jsos.html
- :heavy_check_mark: [path](https://nodejs.org/api/path.html) :arrow_right: https://juancarlospaco.github.io/nodejs/nodejs/jspath.html
- :heavy_check_mark: [perf_hooks](https://nodejs.org/api/perf_hooks.html) :arrow_right: https://juancarlospaco.github.io/nodejs/nodejs/jsperfhooks.html
- :heavy_check_mark: [punycode](https://nodejs.org/api/punycode.html) :arrow_right: https://juancarlospaco.github.io/nodejs/nodejs/jspunycode.html
- :heavy_check_mark: [querystring](https://nodejs.org/api/querystring.html) :arrow_right: https://juancarlospaco.github.io/nodejs/nodejs/jsquerystring.html
- :heavy_check_mark: [util](https://nodejs.org/api/util.html) :arrow_right: https://juancarlospaco.github.io/nodejs/nodejs/jsutils.html
- :heavy_check_mark: [v8](https://nodejs.org/api/v8.html) :arrow_right: https://juancarlospaco.github.io/nodejs/nodejs/jsv8.html
- :heavy_check_mark: [zlib](https://nodejs.org/api/zlib.html) :arrow_right: https://juancarlospaco.github.io/nodejs/nodejs/jszlib.html
- :heavy_check_mark: Custom NodeJS-optimized syntax sugar :arrow_right: https://juancarlospaco.github.io/nodejs/nodejs/jsugar.html
- :heavy_check_mark: `import`    "Static", async,  lexical,     parse errors,    ES6+    , needs `--experimental-modules`
- :heavy_check_mark: `require()` Dynamic,  sync,   non-lexical, run-time errors, CommonJS, Default
- :trollface: More supported modules soon...


# Install

- `nimble install nodejs` OR `nimble install https://github.com/juancarlospaco/nodejs.git`


# Use

```nim
import nodejs
requireFs()  # CommonJS
# importFs() # ES6+
writeFileSync(r"file.txt", r"Hello from NodeJS") # Use NodeJS API
```


# Design

- It does not use anything from Nim standard library, very future-proof,
  just imports some types to be compatible with it, like `RegExp`, etc.
- We do not deprecate stuff, even if NodeJS deprecate/remove it, it will keep working for Nim.
- Stuff deprecated/demoved before year 2020 will not be supported.


# Efficiency

- is it any good ?, improves something ?.

```nim
import jsconsole, nodejs
console.log base64encode("example")
```

This module generated JavaScript:

```javascript
console.log(Buffer.from("example", "utf-8").toString("base64"));
```

Standard Library:

```nim
import jsconsole, base64  # Standard Library
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

---

```nim
import jsconsole, nodejs
console.log deduplicate([9, 2, 3, 9, 4, 5, 6, 9])
```

This module generated JavaScript:

```javascript
console.log([...new Set([9, 2, 3, 9, 4, 5, 6, 9])]);
```

Standard Library:

```nim
import jsconsole, sequtils # Standard Library
console.log deduplicate([9, 2, 3, 9, 4, 5, 6, 9])
```

<details>
  <summary>Standard Library Generated JavaScript</summary>

```javascript

var NTI369098754 = {
    size: 0,
    kind: 31,
    base: null,
    node: null,
    finalizer: null
};
var NTI369098779 = {
    size: 0,
    kind: 24,
    base: null,
    node: null,
    finalizer: null
};
NTI369098779.base = NTI369098754;

function setConstr() {
    var result = {};
    for (var i = 0; i < arguments.length; ++i) {
        var x = arguments[i];
        if (typeof(x) == "object") {
            for (var j = x[0]; j <= x[1]; ++j) {
                result[j] = true;
            }
        } else {
            result[x] = true;
        }
    }
    return result;
}
var ConstSet1 = setConstr(17, 16, 4, 18, 27, 19, 23, 22, 21);
function nimCopy(dest_33558821, src_33558822, ti_33558823) {
    var result_33558835 = null;
    switch (ti_33558823.kind) {
        case 21:
        case 22:
        case 23:
        case 5:
            if (!(isFatPointer_33558808(ti_33558823))) {
                result_33558835 = src_33558822;
            } else {
                result_33558835 = [src_33558822[0], src_33558822[1]];
            }
            break;
        case 19:
            if (dest_33558821 === null || dest_33558821 === undefined) {
                dest_33558821 = {};
            } else {
                for (var key in dest_33558821) {
                    delete dest_33558821[key];
                }
            }
            for (var key in src_33558822) {
                dest_33558821[key] = src_33558822[key];
            }
            result_33558835 = dest_33558821;
            break;
        case 18:
        case 17:
            if (!((ti_33558823.base == null))) {
                result_33558835 = nimCopy(dest_33558821, src_33558822, ti_33558823.base);
            } else {
                if ((ti_33558823.kind == 17)) {
                    result_33558835 = (dest_33558821 === null || dest_33558821 === undefined) ? {
                        m_type: ti_33558823
                    } : dest_33558821;
                } else {
                    result_33558835 = (dest_33558821 === null || dest_33558821 === undefined) ? {} : dest_33558821;
                }
            }
            nimCopyAux(result_33558835, src_33558822, ti_33558823.node);
            break;
        case 24:
        case 4:
        case 27:
        case 16:
            if (src_33558822 === null) {
                result_33558835 = null;
            } else {
                if (dest_33558821 === null || dest_33558821 === undefined) {
                    dest_33558821 = new Array(src_33558822.length);
                } else {
                    dest_33558821.length = src_33558822.length;
                }
                result_33558835 = dest_33558821;
                for (var i = 0; i < src_33558822.length; ++i) {
                    result_33558835[i] = nimCopy(result_33558835[i], src_33558822[i], ti_33558823.base);
                }
            }
            break;
        case 28:
            if (src_33558822 !== null) {
                result_33558835 = src_33558822.slice(0);
            }
            break;
        default:
            result_33558835 = src_33558822;
            break;
    }
    return result_33558835;
}
var globalRaiseHook_33557677 = [null];
if (globalThis.localRaiseHook_33557682 === undefined) {
    localRaiseHook_33557682 = [null];
}
var outOfMemHook_33557685 = [null];
var unhandledExceptionHook_33557690 = [null];
function isFatPointer_33558808(ti_33558810) {
    var result_33558811 = false;
    BeforeRet: do {
        result_33558811 = !((ConstSet1[ti_33558810.base.kind] != undefined));
        break BeforeRet;
    } while (false);
    return result_33558811;

}
function nimCopyAux(dest_33558826, src_33558827, n_33558829) {
    switch (n_33558829.kind) {
        case 0:
            break;
        case 1:
            dest_33558826[n_33558829.offset] = nimCopy(dest_33558826[n_33558829.offset], src_33558827[n_33558829.offset], n_33558829.typ);

            break;
        case 2:
            for (var i = 0; i < n_33558829.sons.length; i++) {
                nimCopyAux(dest_33558826, src_33558827, n_33558829.sons[i]);
            }

            break;
        case 3:
            dest_33558826[n_33558829.offset] = nimCopy(dest_33558826[n_33558829.offset], src_33558827[n_33558829.offset], n_33558829.typ);
            for (var i = 0; i < n_33558829.sons.length; ++i) {
                nimCopyAux(dest_33558826, src_33558827, n_33558829.sons[i][1]);
            }
            break;
    }
}
function find_369098843(a_369098847, item_369098848) {
    var result_369098849 = 0;
    BeforeRet: do {
        result_369098849 = 0;
        L1: do {
            var i_369098856 = null;
            var i_369098856_Idx = 0;
            var i_369098947 = 0;
            L2: do {
                L3: while (true) {
                    if (!(i_369098947 < (a_369098847).length)) break L3;
                    i_369098856 = a_369098847;
                    i_369098856_Idx = i_369098947;
                    if ((i_369098856[i_369098856_Idx] == item_369098848)) {
                        break BeforeRet;
                    }
                    result_369098849 += 1;
                    i_369098947 += 1;
                }
            } while (false);
        } while (false);
        result_369098849 = -1;
    } while (false);
    return result_369098849;
}
function contains_369098836(a_369098840, item_369098841) {
    var result_369098842 = false;
    BeforeRet: do {
        result_369098842 = (0 <= find_369098843(a_369098840, item_369098841));
        break BeforeRet;
    } while (false);
    return result_369098842;
}
function deduplicate_369098757(s_369098761, isSorted_369098762) {
    var result_369098764 = [];
    result_369098764 = nimCopy(null, [], NTI369098779);
    if ((0 < (s_369098761).length)) {
        if (isSorted_369098762) {
            var prev_369098784 = s_369098761[0];
            result_369098764.push(prev_369098784);;
            L1: do {
                var i_369098806 = 0;
                var colontmp__369098932 = 0;
                colontmp__369098932 = ((s_369098761).length - 1);
                var res_369098937 = 1;
                L2: do {
                    L3: while (true) {
                        if (!(res_369098937 <= colontmp__369098932)) break L3;
                        i_369098806 = res_369098937;
                        if (!((s_369098761[i_369098806] == prev_369098784))) {
                            prev_369098784 = s_369098761[i_369098806];
                            result_369098764.push(prev_369098784);;
                        }
                        res_369098937 += 1;
                    }
                } while (false);
            } while (false);
        } else {
            L4: do {
                var itm_369098834 = null;
                var itm_369098834_Idx = 0;
                var i_369098944 = 0;
                L5: do {
                    L6: while (true) {
                        if (!(i_369098944 < (s_369098761).length)) break L6;
                        itm_369098834 = s_369098761;
                        itm_369098834_Idx = i_369098944;
                        if (!(contains_369098836(result_369098764, itm_369098834[itm_369098834_Idx]))) {
                            result_369098764.push(itm_369098834[itm_369098834_Idx]);;
                        }
                        i_369098944 += 1;
                    }
                } while (false);
            } while (false);
        }
    }
    return result_369098764;
}

console.log(deduplicate_369098757([9, 2, 3, 9, 4, 5, 6, 9], false));

```

</details>

---

```nim
import nodejs
discard parseBool("FAlsE".cstring)
discard parseBool("tRUe".cstring)
```

This module generated JavaScript:

```javascript
function parseBool_369098753(s_369098755) {
  const value = String(s_369098755).trim();
  if (/^(?:y|Y|1| ON|On|oN|on|yes|YES|YEs|YeS|Yes|yES|yEs|yeS|TRUE|TRUe|TRuE|TRue|TrUE|TrUe|TruE|True|tRUE|tRUe|tRuE|tRue|trUE|trUe|truE|true)$/i.test(value)) {
    return true;
  };
  if (/^(?:n|N|0|NO|No|nO|no|OFF|OFf|OfF|Off|oFF|oFf|ofF|off|FALSE|FALSe|FALsE|FALse|FAlSE|FAlSe|FAlsE|FAlse|FaLSE|FaLSe|FaLsE|FaLse|FalSE|FalSe|FalsE|False|fALSE|fALSe|fALsE|fALse|fAlSE|fAlSe|fAlsE|fAlse|faLSE|faLSe|faLsE|faLse|falSE|falSe|falsE|false)$/i.test(value)) {
    return false;
  };
  assert(false, "Cannot interpret as a bool");
}

var _ = parseBool_369098753("FAlsE");
var _ = parseBool_369098753("tRUe");
```

Standard Library:

```nim
import strutils  # Standard Library
discard parseBool("FAlsE")
discard parseBool("tRUe")
```

<details>
  <summary>Standard Library Generated JavaScript</summary>

```javascript

var NTI33556178 = {
    size: 0,
    kind: 17,
    base: null,
    node: null,
    finalizer: null
};
var NTI33556340 = {
    size: 0,
    kind: 22,
    base: null,
    node: null,
    finalizer: null
};
var NTI33554444 = {
    size: 0,
    kind: 29,
    base: null,
    node: null,
    finalizer: null
};
var NTI33556335 = {
    size: 0,
    kind: 22,
    base: null,
    node: null,
    finalizer: null
};
var NTI33556229 = {
    size: 0,
    kind: 17,
    base: null,
    node: null,
    finalizer: null
};
var NTI33556233 = {
    size: 0,
    kind: 17,
    base: null,
    node: null,
    finalizer: null
};
var NTI33556255 = {
    size: 0,
    kind: 17,
    base: null,
    node: null,
    finalizer: null
};
var NTI33554442 = {
    size: 0,
    kind: 28,
    base: null,
    node: null,
    finalizer: null
};
var NNI33556255 = {
    kind: 2,
    len: 0,
    offset: 0,
    typ: null,
    name: null,
    sons: []
};
NTI33556255.node = NNI33556255;
var NNI33556233 = {
    kind: 2,
    len: 0,
    offset: 0,
    typ: null,
    name: null,
    sons: []
};
NTI33556233.node = NNI33556233;
NTI33556335.base = NTI33556229;
NTI33556340.base = NTI33556229;
var NNI33556229 = {
    kind: 2,
    len: 5,
    offset: 0,
    typ: null,
    name: null,
    sons: [{
        kind: 1,
        offset: "parent",
        len: 0,
        typ: NTI33556335,
        name: "parent",
        sons: null
    }, {
        kind: 1,
        offset: "name",
        len: 0,
        typ: NTI33554444,
        name: "name",
        sons: null
    }, {
        kind: 1,
        offset: "message",
        len: 0,
        typ: NTI33554442,
        name: "msg",
        sons: null
    }, {
        kind: 1,
        offset: "trace",
        len: 0,
        typ: NTI33554442,
        name: "trace",
        sons: null
    }, {
        kind: 1,
        offset: "up",
        len: 0,
        typ: NTI33556340,
        name: "up",
        sons: null
    }]
};
NTI33556229.node = NNI33556229;
var NNI33556178 = {
    kind: 2,
    len: 0,
    offset: 0,
    typ: null,
    name: null,
    sons: []
};
NTI33556178.node = NNI33556178;
NTI33556229.base = NTI33556178;
NTI33556233.base = NTI33556229;
NTI33556255.base = NTI33556233;
function mnewString(len_33558572) {
    return new Array(len_33558572);
}
function setConstr() {
    var result = {};
    for (var i = 0; i < arguments.length; ++i) {
        var x = arguments[i];
        if (typeof(x) == "object") {
            for (var j = x[0]; j <= x[1]; ++j) {
                result[j] = true;
            }
        } else {
            result[x] = true;
        }
    }
    return result;
}
var ConstSet1 = setConstr(17, 16, 4, 18, 27, 19, 23, 22, 21);
function nimCopy(dest_33558882, src_33558883, ti_33558884) {
    var result_33558896 = null;
    switch (ti_33558884.kind) {
        case 21:
        case 22:
        case 23:
        case 5:
            if (!(isFatPointer_33558868(ti_33558884))) {
                result_33558896 = src_33558883;
            } else {
                result_33558896 = [src_33558883[0], src_33558883[1]];
            }
            break;
        case 19:
            if (dest_33558882 === null || dest_33558882 === undefined) {
                dest_33558882 = {};
            } else {
                for (var key in dest_33558882) {
                    delete dest_33558882[key];
                }
            }
            for (var key in src_33558883) {
                dest_33558882[key] = src_33558883[key];
            }
            result_33558896 = dest_33558882;
            break;
        case 18:
        case 17:
            if (!((ti_33558884.base == null))) {
                result_33558896 = nimCopy(dest_33558882, src_33558883, ti_33558884.base);
            } else {
                if ((ti_33558884.kind == 17)) {
                    result_33558896 = (dest_33558882 === null || dest_33558882 === undefined) ? {
                        m_type: ti_33558884
                    } : dest_33558882;
                } else {
                    result_33558896 = (dest_33558882 === null || dest_33558882 === undefined) ? {} : dest_33558882;
                }
            }
            nimCopyAux(result_33558896, src_33558883, ti_33558884.node);
            break;
        case 24:
        case 4:
        case 27:
        case 16:
            if (src_33558883 === null) {
                result_33558896 = null;
            } else {
                if (dest_33558882 === null || dest_33558882 === undefined) {
                    dest_33558882 = new Array(src_33558883.length);
                } else {
                    dest_33558882.length = src_33558883.length;
                }
                result_33558896 = dest_33558882;
                for (var i = 0; i < src_33558883.length; ++i) {
                    result_33558896[i] = nimCopy(result_33558896[i], src_33558883[i], ti_33558884.base);
                }
            }
            break;
        case 28:
            if (src_33558883 !== null) {
                result_33558896 = src_33558883.slice(0);
            }
            break;
        default:
            result_33558896 = src_33558883;
            break;
    }
    return result_33558896;
}
var ConstSet2 = setConstr([65, 90]);
function toJSStr(s_33558422) {
    var Tmp5;
    var Tmp7;
    var result_33558423 = null;
    var res_33558482 = newSeq_33558453((s_33558422).length);
    var i_33558484 = 0;
    var j_33558486 = 0;
    L1: do {
        L2: while (true) {
            if (!(i_33558484 < (s_33558422).length)) break L2;
            var c_33558487 = s_33558422[i_33558484];
            if ((c_33558487 < 128)) {
                res_33558482[j_33558486] = String.fromCharCode(c_33558487);
                i_33558484 += 1;
            } else {
                var helper_33558510 = newSeq_33558453(0);
                L3: do {
                    L4: while (true) {
                        if (!true) break L4;
                        var code_33558511 = c_33558487.toString(16);
                        if (((code_33558511).length == 1)) {
                            helper_33558510.push("%0");;
                        } else {
                            helper_33558510.push("%");;
                        }

                        helper_33558510.push(code_33558511);;
                        i_33558484 += 1;
                        if (((s_33558422).length <= i_33558484)) Tmp5 = true;
                        else {
                            Tmp5 = (s_33558422[i_33558484] < 128);
                        }
                        if (Tmp5) {
                            break L3;
                        }
                        c_33558487 = s_33558422[i_33558484];
                    }
                } while (false);
                ++excHandler;
                Tmp7 = framePtr;
                try {
                    res_33558482[j_33558486] = decodeURIComponent(helper_33558510.join(""));
                    --excHandler;
                } catch (EXC) {
                    var prevJSError = lastJSError;
                    lastJSError = EXC;
                    --excHandler;
                    framePtr = Tmp7;
                    res_33558482[j_33558486] = helper_33558510.join("");
                    lastJSError = prevJSError;
                } finally {
                    framePtr = Tmp7;
                }
            }
            j_33558486 += 1;
        }
    } while (false);
    if (res_33558482.length < j_33558486) {
        for (var i = res_33558482.length; i < j_33558486; ++i) res_33558482.push(null);
    } else {
        res_33558482.length = j_33558486;
    };
    result_33558423 = res_33558482.join("");
    return result_33558423;
}
function makeNimstrLit(c_33558414) {
    var ln = c_33558414.length;
    var result = new Array(ln);
    for (var i = 0; i < ln; ++i) {
        result[i] = c_33558414.charCodeAt(i);
    }
    return result;
}
function raiseException(e_33558184, ename_33558185) {
    e_33558184.name = ename_33558185;
    if ((excHandler == 0)) {
        unhandledException(e_33558184);
    }
    throw e_33558184;
}
function isFatPointer_33558868(ti_33558870) {
    var result_33558871 = false;
    BeforeRet: do {
        result_33558871 = !((ConstSet1[ti_33558870.base.kind] != undefined));
        break BeforeRet;
    } while (false);
    return result_33558871;
}
function nimCopyAux(dest_33558887, src_33558888, n_33558890) {
    switch (n_33558890.kind) {
        case 0:
            break;
        case 1:
            dest_33558887[n_33558890.offset] = nimCopy(dest_33558887[n_33558890.offset], src_33558888[n_33558890.offset], n_33558890.typ);
            break;
        case 2:
            for (var i = 0; i < n_33558890.sons.length; i++) {
                nimCopyAux(dest_33558887, src_33558888, n_33558890.sons[i]);
            }
            break;
        case 3:
            dest_33558887[n_33558890.offset] = nimCopy(dest_33558887[n_33558890.offset], src_33558888[n_33558890.offset], n_33558890.typ);
            for (var i = 0; i < n_33558890.sons.length; ++i) {
                nimCopyAux(dest_33558887, src_33558888, n_33558890.sons[i][1]);
            }
            break;
    }
}
function nsuNormalize(s_486539481) {
    var result_486539482 = [];
    result_486539482 = nimCopy(null, mnewString((s_486539481).length), NTI33554442);
    var j_486539484 = 0;
    L1: do {
        var i_486539493 = 0;
        var colontmp__369098755 = 0;
        colontmp__369098755 = ((s_486539481).length - 1);
        var res_369098756 = 0;
        L2: do {
            L3: while (true) {
                if (!(res_369098756 <= colontmp__369098755)) break L3;
                i_486539493 = res_369098756;
                if ((ConstSet2[s_486539481[i_486539493]] != undefined)) {
                    result_486539482[j_486539484] = (s_486539481[i_486539493] + 32);
                    j_486539484 += 1;
                } else {
                    if (!((s_486539481[i_486539493] == 95))) {
                        result_486539482[j_486539484] = s_486539481[i_486539493];
                        j_486539484 += 1;
                    }
                }
                res_369098756 += 1;
            }
        } while (false);
    } while (false);
    if (!((j_486539484 == (s_486539481).length))) {
        (result_486539482.length = j_486539484);
    }
    return result_486539482;
}
function newSeq_33558453(len_33558456) {
    var result_33558458 = [];
    result_33558458 = new Array(len_33558456);
    for (var i = 0; i < len_33558456; ++i) {
        result_33558458[i] = null;
    }
    return result_33558458;
}
function add_33557769(x_33557772, x_33557772_Idx, y_33557773) {
    if (x_33557772[x_33557772_Idx] === null) {
        x_33557772[x_33557772_Idx] = [];
    }
    var off = x_33557772[x_33557772_Idx].length;
    x_33557772[x_33557772_Idx].length += y_33557773.length;
    for (var i = 0; i < y_33557773.length; ++i) {
        x_33557772[x_33557772_Idx][off + i] = y_33557773.charCodeAt(i);
    }
}
function unhandledException(e_33558177) {
    var buf_33558178 = [
        []
    ];
    if (!(((e_33558177.message).length == 0))) {
        buf_33558178[0].push.apply(buf_33558178[0], makeNimstrLit("Error: unhandled exception: "));;
        buf_33558178[0].push.apply(buf_33558178[0], e_33558177.message);;
    } else {
        buf_33558178[0].push.apply(buf_33558178[0], makeNimstrLit("Error: unhandled exception"));;
    }
    buf_33558178[0].push.apply(buf_33558178[0], makeNimstrLit(" ["));;
    add_33557769(buf_33558178, 0, e_33558177.name);
    buf_33558178[0].push.apply(buf_33558178[0], makeNimstrLit("]\x0A"));;
    var cbuf_33558180 = toJSStr(buf_33558178[0]);
    framePtr = null;
    if (typeof(Error) !== "undefined") {
        throw new Error(cbuf_33558180);
    } else {
        throw cbuf_33558180;
    }
}
function parseBool_486540961(s_486540963) {
    var result_486540964 = false;
    switch (toJSStr(nsuNormalize(s_486540963))) {
        case "y":
        case "yes":
        case "true":
        case "1":
        case "on":
            result_486540964 = true;
            break;
        case "n":
        case "no":
        case "false":
        case "0":
        case "off":
            result_486540964 = false;
            break;
        default:
            raiseException({
                message: (makeNimstrLit("cannot interpret as a bool: ") || []).concat(s_486540963 || []),
                parent: null,
                m_type: NTI33556255,
                name: null,
                trace: [],
                up: null
            }, "ValueError");
            break;
    }
    return result_486540964;
}

var _ = parseBool_486540961(makeNimstrLit("FAlsE"));
var _ = parseBool_486540961(makeNimstrLit("tRUe"));

```

</details>

See also:
- https://github.com/nim-lang/Nim/wiki/Nim-for-TypeScript-Programmers#table-of-contents
- https://github.com/nim-lang/Nim/issues/7505#issue-311496454
- https://github.com/nim-lang/Nim/issues/3124#issue-95352255


# Stars

![](https://starchart.cc/juancarlospaco/nodejs.svg)


[ :arrow_up: Go to the top](#nodejs-standard-library-for-nim)
