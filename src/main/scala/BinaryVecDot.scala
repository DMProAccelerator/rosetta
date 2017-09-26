package rosetta
import Chisel._

class BinaryVecDot() extends Module {
    val io = new Bundle{
         val a = UInt(INPUT, width=32)
         val b = UInt(INPUT, width=32)
         val out = UInt(OUTPUT, width=32)
         val ready = Bool(OUTPUT)
    }
    io.ready := UInt(0)
    io.out := PopCount(io.a & io.b)
}

class BinaryVecDotTest(c: BinaryVecDot) extends Tester(c) {
    poke(c.io.a, 7)
    poke(c.io.b, 5)
    step(1)
    peek(c.io.out)
}

