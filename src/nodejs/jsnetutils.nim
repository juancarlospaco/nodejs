
func toIpAddress*(ip: uint64): array[4, uint8] =
  ## Converts an `uint64` to an IP Address (IPv4).
  doAssert not(ip > 4_294_967_295.uint64), "IP Address must not be bigger than 255.255.255.255"
  [
    uint8((ip and 0xff000000.uint64) shr 24),
    uint8((ip and 0xff0000.uint64)   shr 16),
    uint8((ip and 0xff00.uint64)     shr 8 ),
    uint8( ip and 0xff.uint64),
  ]

func toUint*(ip: array[4, uint8]): uint64 =
  ## Converts an IP Address (IPv4) to an `uint64`.
  uint64(
    cast[uint64](ip[0]) shl 24 +
    cast[uint64](ip[1]) shl 16 +
    cast[uint64](ip[2]) shl 8  +
    cast[uint64](ip[3])
  )


runnableExamples:
  template example() =
    doAssert 0.uint64.toIpAddress.toUint == 0.uint64                         # 0.0.0.0
    doAssert 1.uint64.toIpAddress.toUint == 1.uint64                         # 0.0.0.1
    doAssert 4_294_967_295.uint64.toIpAddress.toUint == 4_294_967_295.uint64 # 255.255.255.255
    doAssert 2_130_706_433.uint64.toIpAddress.toUint == 2_130_706_433.uint64 # 127.0.0.1
    doAssert 3_232_235_521.uint64.toIpAddress.toUint == 3_232_235_521.uint64 # 192.168.0.1

  example()
  static: example()
