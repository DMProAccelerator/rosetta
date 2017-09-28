package rosetta
import Chisel._

class VecVecDot() extends Module {
    val io = new Bundle{
        val a = UInt(INPUT, width=32)
        val b = UInt(INPUT, width=32)
        val write_enable = Bool(INPUT)
        val reset = Bool(INPUT)
        val out = UInt(OUTPUT, width=32)
        val data_valid = Bool(OUTPUT)
    }

    val bvd = Module(new BinaryVecDot())
    val accumulator = Reg(init=UInt(0, 16))
    val accumulated = Reg(init=UInt(0))

    bvd.io.a = io.a
    bvd.io.b = io.b

    accumulator := accumulator + bvd.io.out
    io.out := accumulator

    when (io.write_enable === Bool(True)) {
        accumulated := UInt(1)
    } .elsewhen (io.reset) {
        accumulated := UInt(0)
    }

    io.data_valid := accumulated
}


