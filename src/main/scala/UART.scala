/*
 * Copyright: 2014-2017, Technical University of Denmark, DTU Compute
 * Author: Martin Schoeberl (martin@jopdesign.com)
 * License: Simplified BSD License
 * 
 * A UART is a serial port, also called an RS232 interface.
 * 
 */

package rosetta

import Chisel._

//import fpgatidbits.dma._
//import fpgatidbits.streams._
//import fpgatidbits.PlatformWrapper._
/*package fpgatidbits.Testbenches

import Chisel._

import fpgatidbits.PlatformWrapper._
import fpgatidbits.rosetta._
*/
/**
 * Transmit part of the UART.
 * A minimal version without any additional buffering.
 * Use an AXI like valid/ready handshake.
 */
class UART(frequency: Int, baudRate: Int) extends RosettaAccelerator {
  //val p = PYNQParams
  val numMemPorts = 0
  val io = new RosettaAcceleratorIF(numMemPorts) {
    //val txd = Bits(OUTPUT, 1)
    val data = Bits(INPUT, 8)
    val ready = Bool(OUTPUT)
    val valid = Bool(INPUT)
  }

  val BIT_CNT = UInt((frequency + baudRate / 2) / baudRate - 1)
  val shiftReg = Reg(init = Bits(0x3f))
  val cntReg = Reg(init = UInt(0, 20))
  val bitsReg = Reg(init = UInt(0, 4))

  val prevValid = Reg(next = io.valid)

  io.ready := (cntReg === UInt(0)) && (bitsReg === UInt(0))
  io.tx := shiftReg(0)

  when(cntReg === UInt(0)) {
    cntReg := UInt(BIT_CNT)
    when(bitsReg =/= UInt(0)) {
      val shift = shiftReg >> 1
      shiftReg := Cat(Bits(1), shift(9, 0))
      bitsReg := bitsReg - UInt(1)
    }.otherwise {
      when(io.valid && (prevValid === UInt(0))) {
        shiftReg(0) := Bits(0) // start bit
        shiftReg(8, 1) := io.data // data
        shiftReg(10, 9) := Bits(3) // two stop bits
        bitsReg := UInt(11)
      }.otherwise {
        shiftReg := Bits(0x3f)
      }
    }
  }.otherwise {
    cntReg := cntReg - UInt(1)
  }
}
