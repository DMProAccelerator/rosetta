package rosetta

import Chisel._

/*
 *  Class that takes in address for a binary matrix and a binary vector and their respective size (Matrix is of numRows X numCols, vector is of numCols X 1. 
 * We iterate over segments of size wordSize in bits. 
 * We iterate over one vector segment and numSimultaneousVectors row segments at a time, that is, we go through the input vector about numRows/numSimultaneousVectors times to get the final result.
 */

class BinaryMatrixVectorMultiplier(_wordSize:Int, _numSimultaneousVectors:Int) extends Module {
  val wordSize = _wordSize
  val numSimultaneousVectors = _numSimultaneousVectors

  val io = new Bundle(){
    val start = Bool(INPUT)
    val addrA = UInt(INPUT, width=64)
    val addrB = UInt(INPUT, width=64)
    val addrC = UInt(INPUT, width=64)
    val numRows = UInt(INPUT, width=32)
    val numCols = UInt(INPUT, width=32)

    val finished = Bool(OUTPUT)
  }

  val p = PYNQParams

  val reader = Module(new StreamReader(new StreamReaderParams(
    streamWidth = wordSize, fifoElems = 8, mem = p.toMemReqParams(),
    maxBeats = 1, chanID = 0, disableThrottle = true
  ))).io

  val writer = Module(new StreamWriter(new StreamWriterParams(
    streamWidth = p.memDataBits, mem = p.toMemReqParams(), chanID = 0
  ))).io



  // Iteration values for row and column segments
  val iteration_count = Reg(init=UInt(0, width=32))
  val col_count = Reg(init=UInt(0, width=32))

  // The loaded row and column segments
  val row_segments = Vec(numSimultaneousVectors, UInt(width=wordSize))
  val col_segment = UInt(width=wordSize)

  // Result segment
  val res_segment = Vec(numSimultaneousVectors, UInt(width=64))

  // States
  val s_idle :: s_load_column_segment :: s_load_row_segment :: s_compute_res_segment :: s_store_res_segment :: s_finished :: Nil = Enum(UInt(), 6)

  val state = Reg(init=UInt(s_idle))

  // Default values
  io.finished = false

  switch(state){
    is(s_idle){

    }

    is(s_load_column_segment){

    }

    is(s_load_row_segment){

    }

    is(s_compute_res_segment){

    }

    is(s_store_res_segment){

    }

    is(s_finished){

    }
  }
}
