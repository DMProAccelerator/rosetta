package rosetta

import Chisel._
import fpgatidbits.PlatformWrapper._
import fpgatidbits.dma._

class TestBitserial(word_size:Int, W_depth:Int, A_depth:Int) extends RosettaAccelerator {
  val numMemPorts = 3
  val io = new RosettaAcceleratorIF(numMemPorts) {
    val start = Bool(INPUT)
    val addrW = UInt(INPUT, width = 64)
    val addrA = UInt(INPUT, width = 64)
    val addrR = UInt(INPUT, width = 64)
    val W_R = UInt(INPUT, width = 32)
    val W_C = UInt(INPUT, width = 32)
    val A_R = UInt(INPUT, width = 32)
    val A_C = UInt(INPUT, width = 32)
    val byte_count_W = UInt(INPUT, width = 32)
    val byte_count_A = UInt(INPUT, width = 32)
    val byte_count_R = UInt(INPUT, width = 32)
    val done = Bool(OUTPUT)
  }
  val p = PYNQParams

  def make_reader(port: Int, baseAddr : UInt, byteCount : UInt, start:Bool) = {
    val sr = Module(new StreamReader(new StreamReaderParams(
      streamWidth = word_size, fifoElems = 8, mem = p.toMemReqParams(),
      maxBeats = 1, chanID = 0, disableThrottle = true
    ))).io
    sr.start := start
    sr.baseAddr := baseAddr
    sr.byteCount := byteCount
    sr.req <> io.memPort(port).memRdReq
    sr.rsp <> io.memPort(port).memRdRsp
    plugMemWritePort(port)
    sr
  }

  val sw = Module(new StreamWriter(new StreamWriterParams(
    streamWidth = p.memDataBits, mem = p.toMemReqParams(), chanID = 0
  ))).io
  sw.baseAddr := io.addrR
  sw.byteCount := io.byte_count_R
  sw.start := io.start
  sw.req <> io.memPort(2).memWrReq
  sw.wdat <> io.memPort(2).memWrDat
  sw.rsp <> io.memPort(2).memWrRsp
  plugMemReadPort(2)

  val GEMM = Module(new BitserialGEMM(word_size, W_depth, A_depth)).io

  val srW = make_reader(port=0, baseAddr=io.addrW, 
    byteCount=io.byte_count_W, start=GEMM.W_start)
  val srA = make_reader(port=1, baseAddr=io.addrA,
    byteCount=io.byte_count_A, start=GEMM.A_start)

  GEMM.start := io.start
  io.done := GEMM.done
  GEMM.W_R := io.W_R
  GEMM.W_C := io.W_C // Currently this needs to be a multiple of word_size
  GEMM.A_R := io.A_R
  GEMM.A_C := io.A_C
  srW.out <> GEMM.W
  srA.out <> GEMM.A
  sw.in   <> GEMM.out

}
