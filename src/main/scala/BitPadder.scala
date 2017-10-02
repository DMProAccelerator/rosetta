package rosetta
import Chisel._

class BitPadder(_numInputLines: Int) extends Module {  

  val numInputLines = _numInputLines
  val numPinsUsefulBits = (Math.ceil(Math.log(numInputLines)/Math.log(2)) + 2).toInt // Including one bit for sign
  println("The number of pins in usefulBits is " + numPinsUsefulBits)
  val io = new Bundle{
    val in = UInt(INPUT, width=numInputLines)
    val usefulBits = SInt(INPUT, width=numPinsUsefulBits)
    val out = UInt(OUTPUT, width=numInputLines)
  }

  val regs = Reg(init=UInt(0, 32)) 
  val downCount = Vec(numInputLines, SInt(width=numPinsUsefulBits))
  
  downCount(0) := io.usefulBits - SInt(1)
  regs(0) := io.in(0) & ~downCount(0)(numPinsUsefulBits - 1)

  for(i <- 1 until numInputLines){
    regs(i) := io.in(i) & ~downCount(i)(numPinsUsefulBits - 1)
    downCount(i) := downCount(i-1) - SInt(1)
  }

  io.out := regs
}

class BitPadderTest(c: BitPadder) extends Tester(c) {
  val numInputLines = c.numInputLines
  for(_ <- 0 until 10){
    val a = rnd.nextInt(1 <<(numInputLines - 2))
    val usefulBits = rnd.nextInt(numInputLines + 1)
     
    val mask = (1 << usefulBits) - 1
    val ans = mask & a

    poke(c.io.in, a)
    poke(c.io.usefulBits, usefulBits)
    step(1)
    expect(c.io.out, ans)
     
  }
}

/*class VecVecDot() extends Module {
    val io = new Bundle{
      val a = UInt(INPUT, width=32)
      val b = UInt(INPUT, width=32)
      val write_enable = Bool(INPUT)
      val done = Bool(INPUT)
      val reset = Bool(INPUT)
      val out = UInt(OUTPUT, width=32)
      val data_valid = Bool(OUTPUT)
    }

    val bvd = Module(new BinaryVecDot())
    val accumulator = Reg(init=UInt(0, 32))
    val accumulated = Reg(init=UInt(0, 1))

    bvd.io.a := io.a
    bvd.io.b := io.b

    when(io.write_enable && !io.done) {
      accumulator := accumulator + bvd.io.out
      accumulated := UInt(1)
    }

    when (io.reset) {
      accumulator := UInt(0)
      accumulated := UInt(0)
    }

    io.data_valid := accumulated
    io.out := accumulator
}


class VecVecDotTest(c: VecVecDot) extends Tester(c) {
  for(testNum <- 0 until 10){
    poke(c.io.write_enable, 0)
    poke(c.io.reset, 1)

    step(1)
    poke(c.io.reset, 0)
    poke(c.io.done, 0)

    val num_vec_parts = 2 + rnd.nextInt(3)

    var expected_total_sum = 0

    for(_ <- 0 until num_vec_parts){
      
      val a = rnd.nextInt(Math.pow(2, 32).toInt)
      val b = rnd.nextInt(Math.pow(2, 32).toInt)
      val andy = a & b

      var expected_partial_sum = 0

      for(j <- 0 until 32){
        if((andy & (1<<j)) != 0){
          expected_partial_sum += 1;
        }
      }

      expected_total_sum = expected_total_sum + expected_partial_sum

      poke(c.io.a, a)
      poke(c.io.b, b)
      poke(c.io.write_enable, 1)
      step(1)

      while(peek(c.io.data_valid) != 1){
        poke(c.io.write_enable, 0)
        step(1)
      }
      peek(c.io.out)
    }
    poke(c.io.done, 1)
    step(1)
    // We want to be able to keep the result around before resetting
    // So i'm just testing if i can step forward without losing it
    for(__ <- 0 until 10)
        step(1)
    expect(c.io.out, expected_total_sum)
  }
}*/
