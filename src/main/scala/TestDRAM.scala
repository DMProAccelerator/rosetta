package rosetta

import Chisel._
import fpgatidbits.dma._
import fpgatidbits.streams._
import fpgatidbits.PlatformWrapper._

class TestDRAM() extends RosettaAccelerator {
  val numMemPorts = 2
  val io = new RosettaAcceleratorIF(numMemPorts) {
    val start = Bool(INPUT)
    val finished = Bool(OUTPUT)
    val addrA = UInt(INPUT, width=64)
    val addrB = UInt(INPUT, width=64)
    //val addrR = UInt(INPUT, width=64)
    val out = UInt(OUTPUT, width=32)
    val byteCount = UInt(INPUT, width=32)
  }

  val reader1 = Module(new StreamReader(new StreamReaderParams(
    streamWidth = 32, fifoElems = 8, mem = PYNQParams.toMemReqParams(),
    maxBeats = 1, chanID = 0, disableThrottle = true
  ))).io
  val reader2 = Module(new StreamReader(new StreamReaderParams(
    streamWidth = 32, fifoElems = 8, mem = PYNQParams.toMemReqParams(),
    maxBeats = 1, chanID = 0, disableThrottle = true
  ))).io

  reader1.start := io.start
  reader2.start := io.start

  reader1.baseAddr := io.addrA
  reader2.baseAddr := io.addrB
  reader1.byteCount := io.byteCount
  reader2.byteCount := io.byteCount

  reader1.req <> io.memPort(0).memRdReq
  reader2.req <> io.memPort(1).memRdReq
  io.memPort(0).memRdRsp <> reader1.rsp
  io.memPort(1).memRdRsp <> reader2.rsp
  plugMemWritePort(0)
  plugMemWritePort(1)

  val vvd = Module(new BinaryVecVec(32)).io
  vvd.start := io.start
  vvd.byte_count := io.byteCount
  io.out := vvd.out.bits
  io.finished := vvd.finished

  reader1.out <> vvd.a
  reader2.out <> vvd.b

  io.signature := makeDefaultSignature()
}

