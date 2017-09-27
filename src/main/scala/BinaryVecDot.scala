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
  for(i <- 0 until 20){
    val a = rnd.nextInt(Math.pow(2, 32).toInt)
    val b = rnd.nextInt(Math.pow(2, 32).toInt)
    val andy = a & b

    var expected_output = 0

    for(j <- 0 until 32){
      if((andy & (1<<j)) != 0){
        expected_output+=1;
      }
    }

    poke(c.io.a, a)
    poke(c.io.b, b)
    step(1)
    expect(c.io.out, expected_output)
  }
}

