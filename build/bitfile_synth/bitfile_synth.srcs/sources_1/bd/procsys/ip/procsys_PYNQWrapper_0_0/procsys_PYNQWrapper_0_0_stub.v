// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
// Date        : Thu Nov 16 16:49:03 2017
// Host        : belgau-ubuntu running 64-bit Ubuntu 16.04.1 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/belgau/Documents/DMPRO/rosetta/build/bitfile_synth/bitfile_synth.srcs/sources_1/bd/procsys/ip/procsys_PYNQWrapper_0_0/procsys_PYNQWrapper_0_0_stub.v
// Design      : procsys_PYNQWrapper_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "PYNQWrapper,Vivado 2016.4" *)
module procsys_PYNQWrapper_0_0(clk, reset, csr_AWREADY, csr_AWVALID, csr_AWADDR, 
  csr_AWPROT, csr_WREADY, csr_WVALID, csr_WDATA, csr_WSTRB, csr_BREADY, csr_BVALID, csr_BRESP, 
  csr_ARREADY, csr_ARVALID, csr_ARADDR, csr_ARPROT, csr_RREADY, csr_RVALID, csr_RDATA, csr_RRESP, 
  mem3_AWREADY, mem3_AWVALID, mem3_AWADDR, mem3_AWSIZE, mem3_AWLEN, mem3_AWBURST, mem3_AWID, 
  mem3_AWLOCK, mem3_AWCACHE, mem3_AWPROT, mem3_AWQOS, mem3_WREADY, mem3_WVALID, mem3_WDATA, 
  mem3_WSTRB, mem3_WLAST, mem3_BREADY, mem3_BVALID, mem3_BID, mem3_BRESP, mem3_ARREADY, 
  mem3_ARVALID, mem3_ARADDR, mem3_ARSIZE, mem3_ARLEN, mem3_ARBURST, mem3_ARID, mem3_ARLOCK, 
  mem3_ARCACHE, mem3_ARPROT, mem3_ARQOS, mem3_RREADY, mem3_RVALID, mem3_RDATA, mem3_RID, 
  mem3_RLAST, mem3_RRESP, mem2_AWREADY, mem2_AWVALID, mem2_AWADDR, mem2_AWSIZE, mem2_AWLEN, 
  mem2_AWBURST, mem2_AWID, mem2_AWLOCK, mem2_AWCACHE, mem2_AWPROT, mem2_AWQOS, mem2_WREADY, 
  mem2_WVALID, mem2_WDATA, mem2_WSTRB, mem2_WLAST, mem2_BREADY, mem2_BVALID, mem2_BID, 
  mem2_BRESP, mem2_ARREADY, mem2_ARVALID, mem2_ARADDR, mem2_ARSIZE, mem2_ARLEN, mem2_ARBURST, 
  mem2_ARID, mem2_ARLOCK, mem2_ARCACHE, mem2_ARPROT, mem2_ARQOS, mem2_RREADY, mem2_RVALID, 
  mem2_RDATA, mem2_RID, mem2_RLAST, mem2_RRESP, mem1_AWREADY, mem1_AWVALID, mem1_AWADDR, 
  mem1_AWSIZE, mem1_AWLEN, mem1_AWBURST, mem1_AWID, mem1_AWLOCK, mem1_AWCACHE, mem1_AWPROT, 
  mem1_AWQOS, mem1_WREADY, mem1_WVALID, mem1_WDATA, mem1_WSTRB, mem1_WLAST, mem1_BREADY, 
  mem1_BVALID, mem1_BID, mem1_BRESP, mem1_ARREADY, mem1_ARVALID, mem1_ARADDR, mem1_ARSIZE, 
  mem1_ARLEN, mem1_ARBURST, mem1_ARID, mem1_ARLOCK, mem1_ARCACHE, mem1_ARPROT, mem1_ARQOS, 
  mem1_RREADY, mem1_RVALID, mem1_RDATA, mem1_RID, mem1_RLAST, mem1_RRESP, mem0_AWREADY, 
  mem0_AWVALID, mem0_AWADDR, mem0_AWSIZE, mem0_AWLEN, mem0_AWBURST, mem0_AWID, mem0_AWLOCK, 
  mem0_AWCACHE, mem0_AWPROT, mem0_AWQOS, mem0_WREADY, mem0_WVALID, mem0_WDATA, mem0_WSTRB, 
  mem0_WLAST, mem0_BREADY, mem0_BVALID, mem0_BID, mem0_BRESP, mem0_ARREADY, mem0_ARVALID, 
  mem0_ARADDR, mem0_ARSIZE, mem0_ARLEN, mem0_ARBURST, mem0_ARID, mem0_ARLOCK, mem0_ARCACHE, 
  mem0_ARPROT, mem0_ARQOS, mem0_RREADY, mem0_RVALID, mem0_RDATA, mem0_RID, mem0_RLAST, 
  mem0_RRESP, io_led, io_sw, io_btn, io_tx)
/* synthesis syn_black_box black_box_pad_pin="clk,reset,csr_AWREADY,csr_AWVALID,csr_AWADDR[31:0],csr_AWPROT[2:0],csr_WREADY,csr_WVALID,csr_WDATA[31:0],csr_WSTRB[3:0],csr_BREADY,csr_BVALID,csr_BRESP[1:0],csr_ARREADY,csr_ARVALID,csr_ARADDR[31:0],csr_ARPROT[2:0],csr_RREADY,csr_RVALID,csr_RDATA[31:0],csr_RRESP[1:0],mem3_AWREADY,mem3_AWVALID,mem3_AWADDR[31:0],mem3_AWSIZE[2:0],mem3_AWLEN[7:0],mem3_AWBURST[1:0],mem3_AWID[5:0],mem3_AWLOCK,mem3_AWCACHE[3:0],mem3_AWPROT[2:0],mem3_AWQOS[3:0],mem3_WREADY,mem3_WVALID,mem3_WDATA[63:0],mem3_WSTRB[7:0],mem3_WLAST,mem3_BREADY,mem3_BVALID,mem3_BID[5:0],mem3_BRESP[1:0],mem3_ARREADY,mem3_ARVALID,mem3_ARADDR[31:0],mem3_ARSIZE[2:0],mem3_ARLEN[7:0],mem3_ARBURST[1:0],mem3_ARID[5:0],mem3_ARLOCK,mem3_ARCACHE[3:0],mem3_ARPROT[2:0],mem3_ARQOS[3:0],mem3_RREADY,mem3_RVALID,mem3_RDATA[63:0],mem3_RID[5:0],mem3_RLAST,mem3_RRESP[1:0],mem2_AWREADY,mem2_AWVALID,mem2_AWADDR[31:0],mem2_AWSIZE[2:0],mem2_AWLEN[7:0],mem2_AWBURST[1:0],mem2_AWID[5:0],mem2_AWLOCK,mem2_AWCACHE[3:0],mem2_AWPROT[2:0],mem2_AWQOS[3:0],mem2_WREADY,mem2_WVALID,mem2_WDATA[63:0],mem2_WSTRB[7:0],mem2_WLAST,mem2_BREADY,mem2_BVALID,mem2_BID[5:0],mem2_BRESP[1:0],mem2_ARREADY,mem2_ARVALID,mem2_ARADDR[31:0],mem2_ARSIZE[2:0],mem2_ARLEN[7:0],mem2_ARBURST[1:0],mem2_ARID[5:0],mem2_ARLOCK,mem2_ARCACHE[3:0],mem2_ARPROT[2:0],mem2_ARQOS[3:0],mem2_RREADY,mem2_RVALID,mem2_RDATA[63:0],mem2_RID[5:0],mem2_RLAST,mem2_RRESP[1:0],mem1_AWREADY,mem1_AWVALID,mem1_AWADDR[31:0],mem1_AWSIZE[2:0],mem1_AWLEN[7:0],mem1_AWBURST[1:0],mem1_AWID[5:0],mem1_AWLOCK,mem1_AWCACHE[3:0],mem1_AWPROT[2:0],mem1_AWQOS[3:0],mem1_WREADY,mem1_WVALID,mem1_WDATA[63:0],mem1_WSTRB[7:0],mem1_WLAST,mem1_BREADY,mem1_BVALID,mem1_BID[5:0],mem1_BRESP[1:0],mem1_ARREADY,mem1_ARVALID,mem1_ARADDR[31:0],mem1_ARSIZE[2:0],mem1_ARLEN[7:0],mem1_ARBURST[1:0],mem1_ARID[5:0],mem1_ARLOCK,mem1_ARCACHE[3:0],mem1_ARPROT[2:0],mem1_ARQOS[3:0],mem1_RREADY,mem1_RVALID,mem1_RDATA[63:0],mem1_RID[5:0],mem1_RLAST,mem1_RRESP[1:0],mem0_AWREADY,mem0_AWVALID,mem0_AWADDR[31:0],mem0_AWSIZE[2:0],mem0_AWLEN[7:0],mem0_AWBURST[1:0],mem0_AWID[5:0],mem0_AWLOCK,mem0_AWCACHE[3:0],mem0_AWPROT[2:0],mem0_AWQOS[3:0],mem0_WREADY,mem0_WVALID,mem0_WDATA[63:0],mem0_WSTRB[7:0],mem0_WLAST,mem0_BREADY,mem0_BVALID,mem0_BID[5:0],mem0_BRESP[1:0],mem0_ARREADY,mem0_ARVALID,mem0_ARADDR[31:0],mem0_ARSIZE[2:0],mem0_ARLEN[7:0],mem0_ARBURST[1:0],mem0_ARID[5:0],mem0_ARLOCK,mem0_ARCACHE[3:0],mem0_ARPROT[2:0],mem0_ARQOS[3:0],mem0_RREADY,mem0_RVALID,mem0_RDATA[63:0],mem0_RID[5:0],mem0_RLAST,mem0_RRESP[1:0],io_led[3:0],io_sw[1:0],io_btn[3:0],io_tx" */;
  input clk;
  input reset;
  output csr_AWREADY;
  input csr_AWVALID;
  input [31:0]csr_AWADDR;
  input [2:0]csr_AWPROT;
  output csr_WREADY;
  input csr_WVALID;
  input [31:0]csr_WDATA;
  input [3:0]csr_WSTRB;
  input csr_BREADY;
  output csr_BVALID;
  output [1:0]csr_BRESP;
  output csr_ARREADY;
  input csr_ARVALID;
  input [31:0]csr_ARADDR;
  input [2:0]csr_ARPROT;
  input csr_RREADY;
  output csr_RVALID;
  output [31:0]csr_RDATA;
  output [1:0]csr_RRESP;
  input mem3_AWREADY;
  output mem3_AWVALID;
  output [31:0]mem3_AWADDR;
  output [2:0]mem3_AWSIZE;
  output [7:0]mem3_AWLEN;
  output [1:0]mem3_AWBURST;
  output [5:0]mem3_AWID;
  output mem3_AWLOCK;
  output [3:0]mem3_AWCACHE;
  output [2:0]mem3_AWPROT;
  output [3:0]mem3_AWQOS;
  input mem3_WREADY;
  output mem3_WVALID;
  output [63:0]mem3_WDATA;
  output [7:0]mem3_WSTRB;
  output mem3_WLAST;
  output mem3_BREADY;
  input mem3_BVALID;
  input [5:0]mem3_BID;
  input [1:0]mem3_BRESP;
  input mem3_ARREADY;
  output mem3_ARVALID;
  output [31:0]mem3_ARADDR;
  output [2:0]mem3_ARSIZE;
  output [7:0]mem3_ARLEN;
  output [1:0]mem3_ARBURST;
  output [5:0]mem3_ARID;
  output mem3_ARLOCK;
  output [3:0]mem3_ARCACHE;
  output [2:0]mem3_ARPROT;
  output [3:0]mem3_ARQOS;
  output mem3_RREADY;
  input mem3_RVALID;
  input [63:0]mem3_RDATA;
  input [5:0]mem3_RID;
  input mem3_RLAST;
  input [1:0]mem3_RRESP;
  input mem2_AWREADY;
  output mem2_AWVALID;
  output [31:0]mem2_AWADDR;
  output [2:0]mem2_AWSIZE;
  output [7:0]mem2_AWLEN;
  output [1:0]mem2_AWBURST;
  output [5:0]mem2_AWID;
  output mem2_AWLOCK;
  output [3:0]mem2_AWCACHE;
  output [2:0]mem2_AWPROT;
  output [3:0]mem2_AWQOS;
  input mem2_WREADY;
  output mem2_WVALID;
  output [63:0]mem2_WDATA;
  output [7:0]mem2_WSTRB;
  output mem2_WLAST;
  output mem2_BREADY;
  input mem2_BVALID;
  input [5:0]mem2_BID;
  input [1:0]mem2_BRESP;
  input mem2_ARREADY;
  output mem2_ARVALID;
  output [31:0]mem2_ARADDR;
  output [2:0]mem2_ARSIZE;
  output [7:0]mem2_ARLEN;
  output [1:0]mem2_ARBURST;
  output [5:0]mem2_ARID;
  output mem2_ARLOCK;
  output [3:0]mem2_ARCACHE;
  output [2:0]mem2_ARPROT;
  output [3:0]mem2_ARQOS;
  output mem2_RREADY;
  input mem2_RVALID;
  input [63:0]mem2_RDATA;
  input [5:0]mem2_RID;
  input mem2_RLAST;
  input [1:0]mem2_RRESP;
  input mem1_AWREADY;
  output mem1_AWVALID;
  output [31:0]mem1_AWADDR;
  output [2:0]mem1_AWSIZE;
  output [7:0]mem1_AWLEN;
  output [1:0]mem1_AWBURST;
  output [5:0]mem1_AWID;
  output mem1_AWLOCK;
  output [3:0]mem1_AWCACHE;
  output [2:0]mem1_AWPROT;
  output [3:0]mem1_AWQOS;
  input mem1_WREADY;
  output mem1_WVALID;
  output [63:0]mem1_WDATA;
  output [7:0]mem1_WSTRB;
  output mem1_WLAST;
  output mem1_BREADY;
  input mem1_BVALID;
  input [5:0]mem1_BID;
  input [1:0]mem1_BRESP;
  input mem1_ARREADY;
  output mem1_ARVALID;
  output [31:0]mem1_ARADDR;
  output [2:0]mem1_ARSIZE;
  output [7:0]mem1_ARLEN;
  output [1:0]mem1_ARBURST;
  output [5:0]mem1_ARID;
  output mem1_ARLOCK;
  output [3:0]mem1_ARCACHE;
  output [2:0]mem1_ARPROT;
  output [3:0]mem1_ARQOS;
  output mem1_RREADY;
  input mem1_RVALID;
  input [63:0]mem1_RDATA;
  input [5:0]mem1_RID;
  input mem1_RLAST;
  input [1:0]mem1_RRESP;
  input mem0_AWREADY;
  output mem0_AWVALID;
  output [31:0]mem0_AWADDR;
  output [2:0]mem0_AWSIZE;
  output [7:0]mem0_AWLEN;
  output [1:0]mem0_AWBURST;
  output [5:0]mem0_AWID;
  output mem0_AWLOCK;
  output [3:0]mem0_AWCACHE;
  output [2:0]mem0_AWPROT;
  output [3:0]mem0_AWQOS;
  input mem0_WREADY;
  output mem0_WVALID;
  output [63:0]mem0_WDATA;
  output [7:0]mem0_WSTRB;
  output mem0_WLAST;
  output mem0_BREADY;
  input mem0_BVALID;
  input [5:0]mem0_BID;
  input [1:0]mem0_BRESP;
  input mem0_ARREADY;
  output mem0_ARVALID;
  output [31:0]mem0_ARADDR;
  output [2:0]mem0_ARSIZE;
  output [7:0]mem0_ARLEN;
  output [1:0]mem0_ARBURST;
  output [5:0]mem0_ARID;
  output mem0_ARLOCK;
  output [3:0]mem0_ARCACHE;
  output [2:0]mem0_ARPROT;
  output [3:0]mem0_ARQOS;
  output mem0_RREADY;
  input mem0_RVALID;
  input [63:0]mem0_RDATA;
  input [5:0]mem0_RID;
  input mem0_RLAST;
  input [1:0]mem0_RRESP;
  output [3:0]io_led;
  input [1:0]io_sw;
  input [3:0]io_btn;
  output io_tx;
endmodule
