package rosetta
import Chisel._

class NewVecVecDot() extends Module {
  val io = new Bundle{
    val a = Decoupled(UInt(INPUT, width=32)).flip
    val b = Decoupled(UInt(INPUT, width=32)).flip
    val reset = Bool(INPUT)
    val finished = Bool(INPUT)
    val out = Decoupled(UInt(OUTPUT, width=32))
  }

  val accumulator = Reg(init=UInt(0, 32))
  val done = Reg(init=UInt(0, 1))
  
  done := io.finished 

  when (io.a.valid & io.b.valid & io.b.ready & io.a.ready) {
    accumulator := accumulator + PopCount(io.a.bits & io.b.bits)
  }

  when (io.reset) {
    accumulator := UInt(0)
    io.a.ready := Bool(true)
    io.b.ready := Bool(true)
  }

  io.out.bits := accumulator
  io.out.valid := done
  
  when (!io.out.ready & done) {
    io.a.ready := Bool(false)  
    io.b.ready := Bool(false)  
  }
}


