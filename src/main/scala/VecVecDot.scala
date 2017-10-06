package rosetta
import Chisel._

// Copying the structue of fpgatidbits StreamReducer
// to make our vector-vector scalar product

class VecVecDot(w: Int) extends Module {
  val io = new Bundle{
    val start = Bool(INPUT)
    val a = Decoupled(UInt(INPUT, width=w)).flip
    val b = Decoupled(UInt(INPUT, width=w)).flip
    val byte_count = UInt(INPUT, width=32)
    val finished = Bool(OUTPUT)
    val out = Decoupled(UInt(OUTPUT, width=32))
  }

  val s_idle :: s_running :: s_finished :: Nil = Enum(UInt(), 3)
  val state = Reg(init=UInt(s_idle))
  val acc = Reg(init=UInt(0, 32))
  val bytes_left = Reg(init=UInt(0, 32))
  val bytes_per_elem = w/8 // e.g: 32 / 8 -> 4

  // Defaults values
  io.finished := Bool(false)
  io.out.bits := acc
  io.out.valid := Bool(false)
  io.a.ready := Bool(false)
  io.b.ready := Bool(false)

  switch(state) {
    is(s_idle) {
      acc := UInt(0)
      bytes_left := io.byte_count
      when (io.start) { state := s_running }
    }
    is(s_running) {
      when (bytes_left === UInt(0)) { state := s_finished }
      .otherwise {
        io.a.ready := Bool(true)
        io.b.ready := Bool(true)
        when (io.a.valid & io.b.valid) {
          acc := acc + PopCount(io.a.bits & io.b.bits)
          bytes_left := bytes_left - UInt(bytes_per_elem)
        }
      }
    }
    is(s_finished) {
      io.finished := Bool(true)
      io.out.valid := Bool(true)
      when (!io.start) { state := s_idle }
    } 

  }

}


