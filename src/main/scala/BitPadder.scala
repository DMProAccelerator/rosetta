package rosetta
import Chisel._

class BitPadder(_numInputLines: Int) extends Module {  

  val numInputLines = _numInputLines
  val numPinsUsefulBits = (Math.ceil(Math.log(numInputLines)/Math.log(2)) + 2).toInt // Including one bit for sign

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
