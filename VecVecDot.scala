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

class VecVecDotTest(c: VecVecDot) extends Tester(c) {
  for(testNum <- 0 until 20){
    poke(c.io.write_enable, 1)
    poke(c.io.reset, 1)
    
    step(1)
    poke(c.io.reset, 0)

    val num_vec_parts = 1 + rnd.nextInt(10)
    
    val expected_total_sum = 0

    for(vecIndex <- 0 until num_vec_parts){ 
      val a = rnd.nextInt(Math.pow(2, 32).toInt)
      val b = rnd.nextInt(Math.pow(2, 32).toInt)
      val andy = a & b

      var expected_partial_sum = 0

      for(j <- 0 until 32){
        if((andy & (1<<j)) != 0){
          expected_partial_sum += 1;
        }
      }

      expected_total_sum += expected_partial_sum

      poke(c.io.a, a)
      poke(c.io.b, b)
      
      poke(c.io.write_enable, 1)
      
      while(peek(c.io.data_valid) != 1){
        step(1)
      }
    }
      
    expect(c.io.out, expected_total_sum)
  }
}
