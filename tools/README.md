# Human-Readable Pretty-Printed JavaScript backend for Nim

```console
$ git clone https://github.com/nim-lang/Nim.git
$ cd Nim
$ rm compiler\jsgen.nim
$ rm lib\system\jssys.nim
$ curl -Lo compiler\jsgen.nim https://raw.githubusercontent.com/juancarlospaco/nodejs/main/tools/jsgen.nim
$ curl -Lo lib\system\jssys.nim https://raw.githubusercontent.com/juancarlospaco/nodejs/main/tools/jssys.nim
$ ./build_all.sh
$ nim c koch.nim
$ ./koch boot
$ ./bin/nim --version
```

- See `./bin/nim` for your newly improved Nim compiler binary. Use like `nim js -d:danger file.nim`.
- Implemented on year 2022, Nim commit >= `ff25103c9ab9d51821e9e8641955c8d24f7db6b8`.
