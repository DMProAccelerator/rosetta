package rosetta

import Chisel._
import fpgatidbits.dma._
import fpgatidbits.streams._
import fpgatidbits.PlatformWrapper._

class DRAMExample() extends RosettaAccelerator {
  val numMemPorts = 1
  val io = new RosettaAcceleratorIF(numMemPorts) {
    val start = Bool(INPUT)
    val finished = Bool(OUTPUT)
    val baseAddr = UInt(INPUT, width = 64)
    val byteCount = UInt(INPUT, width = 32)
    val sum = UInt(OUTPUT, width = 32)
    val cycleCount = UInt(OUTPUT, width = 32)
  }
  val rdP = new StreamReaderParams(
    streamWidth = 32,
    fifoElems = 8,
    mem = PYNQParams.toMemReqParams(),
    maxBeats = 1,
    chanID = 0,
    disableThrottle = true
  )

  val reader = Module(new StreamReader(rdP)).io
  val accumulator = Module(new Accumulator(32)).io

  reader.start := io.start
  accumulator.start := io.start

  reader.baseAddr := io.baseAddr
  reader.byteCount := io.byteCount
  accumulator.byte_count := io.byteCount

  io.sum := accumulator.out.bits
  io.finished := accumulator.finished

  reader.req <> io.memPort(0).memRdReq
  io.memPort(0).memRdRsp <> reader.rsp
  plugMemWritePort(0)

  reader.out <> accumulator.in

  // instantiate a cycle counter for benchmarking
  val regCycleCount = Reg(init = UInt(0, 32))
  io.cycleCount := regCycleCount
  when(!io.start) {regCycleCount := UInt(0)}
  .elsewhen(io.start & !io.finished) {regCycleCount := regCycleCount + UInt(1)}

  // the signature can be e.g. used for checking that the accelerator has the
  // correct version. here the signature is regenerated from the current date.
  io.signature := makeDefaultSignature()
}
