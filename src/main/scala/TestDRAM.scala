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
    val addrR = UInt(INPUT, width=64)
    val out = UInt(OUTPUT, width=32)
    val byteCount = UInt(INPUT, width=32)
  }
   
  val rdP = new StreamReaderParams(
    streamWidth = 32,
    fifoElems = 8,
    mem = PYNQParams.toMemReqParams(),
    maxBeats = 1,
    chanID = 0,
    disableThrottle = true
  )

  val reader1 = Module(new StreamReader(rdP)).io
  val reader2 = Module(new StreamReader(rdP)).io
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

  /*
  val wrP = new StreamWriterParams(
    streamWidth = 32,
    mem = PYNQParams.toMemReqParams(),
    chanID = 0
  )
  val writer = Module(new StreamWriter(wrP)).io
  writer.baseAddr := io.addrR
  writer.byteCount := io.byteCount
  writer.start := io.start

  writer.req <> io.memPort(2).memWrReq
  writer.wdat <> io.memPort(2).memWrDat
  io.memPort(2).memWrRsp <> writer.rsp
  plugMemReadPort(2)
  */

  val vvd = Module(new NewVecVecDot(32)).io
  vvd.start := io.start
  vvd.byte_count := io.byteCount
  reader1.out <> vvd.a
  reader2.out <> vvd.b
  io.out := vvd.out.bits
  io.finished := vvd.finished

  io.signature := makeDefaultSignature()
}

