package rosetta
import Chisel._

class VecVecDot() extends Module {
    val io = new Bundle{
         val a = UInt(INPUT, width=32)
         val b = UInt(INPUT, width=32)
         val write_enable = Bool(INPUT)
         val reset = Bool(INPUT)
         val out = UInt(OUTPUT, width=32)
    }

    val accumulated = Reg(init=UInt(0))

}


