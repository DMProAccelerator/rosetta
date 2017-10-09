package rosetta

import Chisel._
import fpgatidbits.dma._
import fpgatidbits.streams._
import fpgatidbits.PlatformWrapper._

// add your custom accelerator here, derived from RosettaAccelerator

// here we have a test for register reads and writes: add two 64-bit values
// the io bundle has the following signals:
// op: vector of two 64-bit signals, input values to be added
// sum: output 64-bit signal, equal to op(0)+op(1)
// cc: the number of clock cycles that have elapsed since last reset
class StreamWriterSample() extends RosettaAccelerator {
  val numMemPorts = 1
  val io = new RosettaAcceleratorIF(numMemPorts) {
    val addr = UInt(INPUT, width=64)
    val start = Bool(INPUT)
    val output = UInt(OUTPUT, width=32)
    val finished = Bool(OUTPUT)

    val writer_error = Bool(OUTPUT)
    val writer_ready = Bool(OUTPUT)

    val cc = UInt(OUTPUT, width=32)
  }

  // register to contain output
  val output_reg = Reg(init = UInt(12345, 32))
  // instantiate a clock cycle counter register
  val regCC = Reg(init = UInt(0, 32))
  // increment counter by 1 every clock cycle
  regCC := regCC + UInt(1)
  // expose counter through the output called cc
  io.cc := regCC


  val wp = new StreamWriterParams(
    streamWidth = 64,
    mem = PYNQParams.toMemReqParams(),
    chanID = 0
  )
  val writer = Module(new StreamWriter(wp)).io

  when(io.start){
    io.output := output_reg 
  }.otherwise{
    io.output := UInt(0)
  }

  writer.baseAddr := io.addr
  writer.byteCount := UInt(8)
  writer.start := io.start
  writer.req <> io.memPort(0).memWrReq
  writer.wdat <> io.memPort(0).memWrDat
  io.memPort(0).memWrRsp <> writer.rsp
  plugMemReadPort(0)
  
  writer.in.bits := output_reg
  writer.in.valid := io.start

  io.writer_error := writer.error
  io.writer_ready := writer.in.ready

  io.finished := writer.finished

   // in addition to the signals we defined here, there are some signals that
  // are always present in the io bundle, as we derive from RosettaAcceleratorIF

  // the signature can be e.g. used for checking that the accelerator has the
  // correct version. here the signature is regenerated from the current date.
  io.signature := makeDefaultSignature()
}
