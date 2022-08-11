# Human-Readable Pretty-Printed JavaScript backend for Nim

```console
$ git clone https://github.com/nim-lang/Nim.git
$ cd Nim
$ curl -Lo compiler\jsgen.nim https://raw.githubusercontent.com/juancarlospaco/nodejs/main/tools/jsgen.nim
$ curl -Lo lib\system\jssys.nim https://raw.githubusercontent.com/juancarlospaco/nodejs/main/tools/jssys.nim
$ ./build_all.sh
$ nim c koch.nim
$ ./koch boot
$ ./bin/nim --version
```

- See `./bin/nim` for your newly improved Nim compiler binary. Use like `nim js -d:danger file.nim`.
- Implemented on year 2022, Nim commit >= `3fef2fd52c86ba922187ca03026b09ceb70b5d3d`.
