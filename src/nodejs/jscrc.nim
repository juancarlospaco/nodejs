## * Cyclic redundancy check for JavaScript targets.

template toString(crc: var uint32; s: var string) =
  s.setLen 8
  var n = crc.int64
  s[7] = "0123456789ABCDEF"[int(n and 0xF)]
  n = n shr 4
  s[6] = "0123456789ABCDEF"[int(n and 0xF)]
  n = n shr 4
  s[5] = "0123456789ABCDEF"[int(n and 0xF)]
  n = n shr 4
  s[4] = "0123456789ABCDEF"[int(n and 0xF)]
  n = n shr 4
  s[3] = "0123456789ABCDEF"[int(n and 0xF)]
  n = n shr 4
  s[2] = "0123456789ABCDEF"[int(n and 0xF)]
  n = n shr 4
  s[1] = "0123456789ABCDEF"[int(n and 0xF)]
  n = n shr 4
  s[0] = "0123456789ABCDEF"[int(n and 0xF)]

func createCrcTable(): array[0..255, uint32] =
  for i in 0.uint32..255.uint32:
    var rem = i
    for j in 0..7:
      if (rem and 1) > 0'u32: rem = (rem shr 1) xor uint32(0xedb88320)
      else: rem = rem shr 1
    result[i] = rem

template updateCrc32(c: char, crc: var uint32) =
  crc = (crc shr 8) xor static(createCrcTable())[uint32(crc and 0xff) xor uint32(ord(c))]

func crc32*(input: var string) =
  var crcuint = uint32(0xFFFFFFFF)
  for c in input: updateCrc32(c, crcuint)
  crcuint = not crcuint
  toString(crcuint, input)


runnableExamples"-b:js -d:nodejs":
  from std/sugar import dup

  var x = "The quick brown fox jumps over the lazy dog."
  crc32(x)  ## In-Place.
  doAssert x == "519025E9"
  doAssert "The quick brown fox jumps over the lazy dog.".dup(crc32) == "519025E9"  ## Out-Place.

  var e = " "
  crc32(e)  ## In-Place.
  doAssert e == "E96CCF45"
  doAssert " ".dup(crc32) == "E96CCF45"  ## Out-Place.

  var z = ""
  crc32(z)   ## In-Place.
  doAssert z == "00000000"
  doAssert "".dup(crc32) == "00000000"  ## Out-Place.
