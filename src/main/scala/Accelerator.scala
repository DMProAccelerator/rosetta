package rosetta

import Chisel._
import fpgatidbits.dma._
import fpgatidbits.streams._
import fpgatidbits.PlatformWrapper._

class TestDRAM() extends RosettaAccelerator {
  val numMemPorts = 3
  val io = new RosettaAcceleratorIF(numMemPorts) {
    val start = Bool(INPUT)
    val finished = Bool(OUTPUT)
    val addrA = UInt(INPUT, width=64)
    val addrB = UInt(INPUT, width=64)
    val addrR = UInt(INPUT, width=64)
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

  val vvd = Module(new NewVecVecDot()).io

  vvd.reset := Bool(false)
  vvd.a <> reader1.out
  vvd.b <> reader2.out

  vvd.finished := reader1.finished & reader2.finished

  val wrP = new StreamWriterParams(
    streamWidth = 32,
    mem = PYNQParams.toMemReqParams(),
    chanID = 0
  )
  val writer = Module(new StreamWriter(wrP)).io
  writer.baseAddr := io.addrR
  writer.byteCount := UInt(4)

  writer.in <> vvd.out
  writer.start := io.start
  io.finished := Bool(false)
  when (writer.finished) {
    vvd.reset := Bool(true)
    io.finished := Bool(true)  
  }

  writer.req <> io.memPort(2).memWrReq
  writer.wdat <> io.memPort(2).memWrDat
  io.memPort(2).memWrRsp <> writer.rsp
  plugMemReadPort(2)

  io.signature := makeDefaultSignature()
}

class TestVecVec() extends RosettaAccelerator {
  val numMemPorts = 0
  val io = new RosettaAcceleratorIF(numMemPorts) {
    val vec_a = UInt(INPUT, width=32)
    val vec_b = UInt(INPUT, width=32)
    val write_enable = Bool(INPUT)
    val reset = Bool(INPUT)
    val out = UInt(OUTPUT, width=32)
    val cc = UInt(OUTPUT)        
  }
    
  val prev_wen = Reg(init=UInt(0, 1))
  prev_wen := io.write_enable

  val vvd = Module(new VecVecDot()).io
  val padderA = Module(new BitPadder(32)).io
  val padderB = Module(new BitPadder(32)).io
  
  padderA.in := io.vec_a
  padderA.usefulBits := SInt(32)

  padderB.in := io.vec_b
  padderB.usefulBits := SInt(32)

  vvd.a := padderA.out
  vvd.b := padderB.out
  vvd.write_enable := io.write_enable & ~prev_wen

  vvd.a := io.vec_a
  vvd.b := io.vec_b
  vvd.reset := io.reset
  io.out := vvd.out

  val regCC = Reg(init=UInt(0, 32))
  io.cc := regCC
  regCC := regCC + UInt(1)

  io.signature := makeDefaultSignature()
}

// add your custom accelerator here, derived from RosettaAccelerator

// here we have a test for register reads and writes: add two 64-bit values
// the io bundle has the following signals:
// op: vector of two 64-bit signals, input values to be added
// sum: output 64-bit signal, equal to op(0)+op(1)
// cc: the number of clock cycles that have elapsed since last reset
class TestRegOps() extends RosettaAccelerator {
  val numMemPorts = 0
  val io = new RosettaAcceleratorIF(numMemPorts) {
    val op = Vec.fill(2) {UInt(INPUT, width = 64)}
    val sum = UInt(OUTPUT, width = 64)
    val cc = UInt(OUTPUT, width = 32)
  }
  // wire sum output to sum of op inputs
  io.sum := io.op(0) + io.op(1)

  // instantiate a clock cycle counter register
  val regCC = Reg(init = UInt(0, 32))
  // increment counter by 1 every clock cycle
  regCC := regCC + UInt(1)
  // expose counter through the output called cc
  io.cc := regCC

  // in addition to the signals we defined here, there are some signals that
  // are always present in the io bundle, as we derive from RosettaAcceleratorIF

  // the signature can be e.g. used for checking that the accelerator has the
  // correct version. here the signature is regenerated from the current date.
  io.signature := makeDefaultSignature()
  // use the buttons to control the LEDs
  io.led := io.btn
}
