#[
autogenerated by docgen
loc: /home/runner/work/nodejs/nodejs/src/nodejs/jsugar.nim(146, 3)
rdoccmd: 
]#
import "/home/runner/work/nodejs/nodejs/src/nodejs/jsugar.nim"
doAssert suffixAmPm(0) == "12am".cstring
doAssert suffixAmPm(5) == "5am".cstring
doAssert suffixAmPm(12) == "12pm".cstring
doAssert suffixAmPm(15) == "3pm".cstring
doAssert suffixAmPm(23) == "11pm".cstring
doAssert suffixAmPm(-23) == "11pm".cstring