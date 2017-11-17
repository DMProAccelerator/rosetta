// (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: user.org:module_ref:PYNQWrapper:1.0
// IP Revision: 1

(* X_CORE_INFO = "PYNQWrapper,Vivado 2016.4" *)
(* CHECK_LICENSE_TYPE = "procsys_PYNQWrapper_0_0,PYNQWrapper,{}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module procsys_PYNQWrapper_0_0 (
  clk,
  reset,
  csr_AWREADY,
  csr_AWVALID,
  csr_AWADDR,
  csr_AWPROT,
  csr_WREADY,
  csr_WVALID,
  csr_WDATA,
  csr_WSTRB,
  csr_BREADY,
  csr_BVALID,
  csr_BRESP,
  csr_ARREADY,
  csr_ARVALID,
  csr_ARADDR,
  csr_ARPROT,
  csr_RREADY,
  csr_RVALID,
  csr_RDATA,
  csr_RRESP,
  mem3_AWREADY,
  mem3_AWVALID,
  mem3_AWADDR,
  mem3_AWSIZE,
  mem3_AWLEN,
  mem3_AWBURST,
  mem3_AWID,
  mem3_AWLOCK,
  mem3_AWCACHE,
  mem3_AWPROT,
  mem3_AWQOS,
  mem3_WREADY,
  mem3_WVALID,
  mem3_WDATA,
  mem3_WSTRB,
  mem3_WLAST,
  mem3_BREADY,
  mem3_BVALID,
  mem3_BID,
  mem3_BRESP,
  mem3_ARREADY,
  mem3_ARVALID,
  mem3_ARADDR,
  mem3_ARSIZE,
  mem3_ARLEN,
  mem3_ARBURST,
  mem3_ARID,
  mem3_ARLOCK,
  mem3_ARCACHE,
  mem3_ARPROT,
  mem3_ARQOS,
  mem3_RREADY,
  mem3_RVALID,
  mem3_RDATA,
  mem3_RID,
  mem3_RLAST,
  mem3_RRESP,
  mem2_AWREADY,
  mem2_AWVALID,
  mem2_AWADDR,
  mem2_AWSIZE,
  mem2_AWLEN,
  mem2_AWBURST,
  mem2_AWID,
  mem2_AWLOCK,
  mem2_AWCACHE,
  mem2_AWPROT,
  mem2_AWQOS,
  mem2_WREADY,
  mem2_WVALID,
  mem2_WDATA,
  mem2_WSTRB,
  mem2_WLAST,
  mem2_BREADY,
  mem2_BVALID,
  mem2_BID,
  mem2_BRESP,
  mem2_ARREADY,
  mem2_ARVALID,
  mem2_ARADDR,
  mem2_ARSIZE,
  mem2_ARLEN,
  mem2_ARBURST,
  mem2_ARID,
  mem2_ARLOCK,
  mem2_ARCACHE,
  mem2_ARPROT,
  mem2_ARQOS,
  mem2_RREADY,
  mem2_RVALID,
  mem2_RDATA,
  mem2_RID,
  mem2_RLAST,
  mem2_RRESP,
  mem1_AWREADY,
  mem1_AWVALID,
  mem1_AWADDR,
  mem1_AWSIZE,
  mem1_AWLEN,
  mem1_AWBURST,
  mem1_AWID,
  mem1_AWLOCK,
  mem1_AWCACHE,
  mem1_AWPROT,
  mem1_AWQOS,
  mem1_WREADY,
  mem1_WVALID,
  mem1_WDATA,
  mem1_WSTRB,
  mem1_WLAST,
  mem1_BREADY,
  mem1_BVALID,
  mem1_BID,
  mem1_BRESP,
  mem1_ARREADY,
  mem1_ARVALID,
  mem1_ARADDR,
  mem1_ARSIZE,
  mem1_ARLEN,
  mem1_ARBURST,
  mem1_ARID,
  mem1_ARLOCK,
  mem1_ARCACHE,
  mem1_ARPROT,
  mem1_ARQOS,
  mem1_RREADY,
  mem1_RVALID,
  mem1_RDATA,
  mem1_RID,
  mem1_RLAST,
  mem1_RRESP,
  mem0_AWREADY,
  mem0_AWVALID,
  mem0_AWADDR,
  mem0_AWSIZE,
  mem0_AWLEN,
  mem0_AWBURST,
  mem0_AWID,
  mem0_AWLOCK,
  mem0_AWCACHE,
  mem0_AWPROT,
  mem0_AWQOS,
  mem0_WREADY,
  mem0_WVALID,
  mem0_WDATA,
  mem0_WSTRB,
  mem0_WLAST,
  mem0_BREADY,
  mem0_BVALID,
  mem0_BID,
  mem0_BRESP,
  mem0_ARREADY,
  mem0_ARVALID,
  mem0_ARADDR,
  mem0_ARSIZE,
  mem0_ARLEN,
  mem0_ARBURST,
  mem0_ARID,
  mem0_ARLOCK,
  mem0_ARCACHE,
  mem0_ARPROT,
  mem0_ARQOS,
  mem0_RREADY,
  mem0_RVALID,
  mem0_RDATA,
  mem0_RID,
  mem0_RLAST,
  mem0_RRESP,
  io_led,
  io_sw,
  io_btn,
  io_tx
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST" *)
input wire reset;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csr AWREADY" *)
output wire csr_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csr AWVALID" *)
input wire csr_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csr AWADDR" *)
input wire [31 : 0] csr_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csr AWPROT" *)
input wire [2 : 0] csr_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csr WREADY" *)
output wire csr_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csr WVALID" *)
input wire csr_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csr WDATA" *)
input wire [31 : 0] csr_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csr WSTRB" *)
input wire [3 : 0] csr_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csr BREADY" *)
input wire csr_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csr BVALID" *)
output wire csr_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csr BRESP" *)
output wire [1 : 0] csr_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csr ARREADY" *)
output wire csr_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csr ARVALID" *)
input wire csr_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csr ARADDR" *)
input wire [31 : 0] csr_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csr ARPROT" *)
input wire [2 : 0] csr_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csr RREADY" *)
input wire csr_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csr RVALID" *)
output wire csr_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csr RDATA" *)
output wire [31 : 0] csr_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 csr RRESP" *)
output wire [1 : 0] csr_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 AWREADY" *)
input wire mem3_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 AWVALID" *)
output wire mem3_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 AWADDR" *)
output wire [31 : 0] mem3_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 AWSIZE" *)
output wire [2 : 0] mem3_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 AWLEN" *)
output wire [7 : 0] mem3_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 AWBURST" *)
output wire [1 : 0] mem3_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 AWID" *)
output wire [5 : 0] mem3_AWID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 AWLOCK" *)
output wire mem3_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 AWCACHE" *)
output wire [3 : 0] mem3_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 AWPROT" *)
output wire [2 : 0] mem3_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 AWQOS" *)
output wire [3 : 0] mem3_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 WREADY" *)
input wire mem3_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 WVALID" *)
output wire mem3_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 WDATA" *)
output wire [63 : 0] mem3_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 WSTRB" *)
output wire [7 : 0] mem3_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 WLAST" *)
output wire mem3_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 BREADY" *)
output wire mem3_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 BVALID" *)
input wire mem3_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 BID" *)
input wire [5 : 0] mem3_BID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 BRESP" *)
input wire [1 : 0] mem3_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 ARREADY" *)
input wire mem3_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 ARVALID" *)
output wire mem3_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 ARADDR" *)
output wire [31 : 0] mem3_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 ARSIZE" *)
output wire [2 : 0] mem3_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 ARLEN" *)
output wire [7 : 0] mem3_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 ARBURST" *)
output wire [1 : 0] mem3_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 ARID" *)
output wire [5 : 0] mem3_ARID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 ARLOCK" *)
output wire mem3_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 ARCACHE" *)
output wire [3 : 0] mem3_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 ARPROT" *)
output wire [2 : 0] mem3_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 ARQOS" *)
output wire [3 : 0] mem3_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 RREADY" *)
output wire mem3_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 RVALID" *)
input wire mem3_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 RDATA" *)
input wire [63 : 0] mem3_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 RID" *)
input wire [5 : 0] mem3_RID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 RLAST" *)
input wire mem3_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem3 RRESP" *)
input wire [1 : 0] mem3_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 AWREADY" *)
input wire mem2_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 AWVALID" *)
output wire mem2_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 AWADDR" *)
output wire [31 : 0] mem2_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 AWSIZE" *)
output wire [2 : 0] mem2_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 AWLEN" *)
output wire [7 : 0] mem2_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 AWBURST" *)
output wire [1 : 0] mem2_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 AWID" *)
output wire [5 : 0] mem2_AWID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 AWLOCK" *)
output wire mem2_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 AWCACHE" *)
output wire [3 : 0] mem2_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 AWPROT" *)
output wire [2 : 0] mem2_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 AWQOS" *)
output wire [3 : 0] mem2_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 WREADY" *)
input wire mem2_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 WVALID" *)
output wire mem2_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 WDATA" *)
output wire [63 : 0] mem2_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 WSTRB" *)
output wire [7 : 0] mem2_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 WLAST" *)
output wire mem2_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 BREADY" *)
output wire mem2_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 BVALID" *)
input wire mem2_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 BID" *)
input wire [5 : 0] mem2_BID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 BRESP" *)
input wire [1 : 0] mem2_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 ARREADY" *)
input wire mem2_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 ARVALID" *)
output wire mem2_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 ARADDR" *)
output wire [31 : 0] mem2_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 ARSIZE" *)
output wire [2 : 0] mem2_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 ARLEN" *)
output wire [7 : 0] mem2_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 ARBURST" *)
output wire [1 : 0] mem2_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 ARID" *)
output wire [5 : 0] mem2_ARID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 ARLOCK" *)
output wire mem2_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 ARCACHE" *)
output wire [3 : 0] mem2_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 ARPROT" *)
output wire [2 : 0] mem2_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 ARQOS" *)
output wire [3 : 0] mem2_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 RREADY" *)
output wire mem2_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 RVALID" *)
input wire mem2_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 RDATA" *)
input wire [63 : 0] mem2_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 RID" *)
input wire [5 : 0] mem2_RID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 RLAST" *)
input wire mem2_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem2 RRESP" *)
input wire [1 : 0] mem2_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 AWREADY" *)
input wire mem1_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 AWVALID" *)
output wire mem1_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 AWADDR" *)
output wire [31 : 0] mem1_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 AWSIZE" *)
output wire [2 : 0] mem1_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 AWLEN" *)
output wire [7 : 0] mem1_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 AWBURST" *)
output wire [1 : 0] mem1_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 AWID" *)
output wire [5 : 0] mem1_AWID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 AWLOCK" *)
output wire mem1_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 AWCACHE" *)
output wire [3 : 0] mem1_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 AWPROT" *)
output wire [2 : 0] mem1_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 AWQOS" *)
output wire [3 : 0] mem1_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 WREADY" *)
input wire mem1_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 WVALID" *)
output wire mem1_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 WDATA" *)
output wire [63 : 0] mem1_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 WSTRB" *)
output wire [7 : 0] mem1_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 WLAST" *)
output wire mem1_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 BREADY" *)
output wire mem1_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 BVALID" *)
input wire mem1_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 BID" *)
input wire [5 : 0] mem1_BID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 BRESP" *)
input wire [1 : 0] mem1_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 ARREADY" *)
input wire mem1_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 ARVALID" *)
output wire mem1_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 ARADDR" *)
output wire [31 : 0] mem1_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 ARSIZE" *)
output wire [2 : 0] mem1_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 ARLEN" *)
output wire [7 : 0] mem1_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 ARBURST" *)
output wire [1 : 0] mem1_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 ARID" *)
output wire [5 : 0] mem1_ARID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 ARLOCK" *)
output wire mem1_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 ARCACHE" *)
output wire [3 : 0] mem1_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 ARPROT" *)
output wire [2 : 0] mem1_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 ARQOS" *)
output wire [3 : 0] mem1_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 RREADY" *)
output wire mem1_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 RVALID" *)
input wire mem1_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 RDATA" *)
input wire [63 : 0] mem1_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 RID" *)
input wire [5 : 0] mem1_RID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 RLAST" *)
input wire mem1_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem1 RRESP" *)
input wire [1 : 0] mem1_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 AWREADY" *)
input wire mem0_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 AWVALID" *)
output wire mem0_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 AWADDR" *)
output wire [31 : 0] mem0_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 AWSIZE" *)
output wire [2 : 0] mem0_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 AWLEN" *)
output wire [7 : 0] mem0_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 AWBURST" *)
output wire [1 : 0] mem0_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 AWID" *)
output wire [5 : 0] mem0_AWID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 AWLOCK" *)
output wire mem0_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 AWCACHE" *)
output wire [3 : 0] mem0_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 AWPROT" *)
output wire [2 : 0] mem0_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 AWQOS" *)
output wire [3 : 0] mem0_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 WREADY" *)
input wire mem0_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 WVALID" *)
output wire mem0_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 WDATA" *)
output wire [63 : 0] mem0_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 WSTRB" *)
output wire [7 : 0] mem0_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 WLAST" *)
output wire mem0_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 BREADY" *)
output wire mem0_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 BVALID" *)
input wire mem0_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 BID" *)
input wire [5 : 0] mem0_BID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 BRESP" *)
input wire [1 : 0] mem0_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 ARREADY" *)
input wire mem0_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 ARVALID" *)
output wire mem0_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 ARADDR" *)
output wire [31 : 0] mem0_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 ARSIZE" *)
output wire [2 : 0] mem0_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 ARLEN" *)
output wire [7 : 0] mem0_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 ARBURST" *)
output wire [1 : 0] mem0_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 ARID" *)
output wire [5 : 0] mem0_ARID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 ARLOCK" *)
output wire mem0_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 ARCACHE" *)
output wire [3 : 0] mem0_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 ARPROT" *)
output wire [2 : 0] mem0_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 ARQOS" *)
output wire [3 : 0] mem0_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 RREADY" *)
output wire mem0_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 RVALID" *)
input wire mem0_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 RDATA" *)
input wire [63 : 0] mem0_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 RID" *)
input wire [5 : 0] mem0_RID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 RLAST" *)
input wire mem0_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem0 RRESP" *)
input wire [1 : 0] mem0_RRESP;
output wire [3 : 0] io_led;
input wire [1 : 0] io_sw;
input wire [3 : 0] io_btn;
output wire io_tx;

  PYNQWrapper inst (
    .clk(clk),
    .reset(reset),
    .csr_AWREADY(csr_AWREADY),
    .csr_AWVALID(csr_AWVALID),
    .csr_AWADDR(csr_AWADDR),
    .csr_AWPROT(csr_AWPROT),
    .csr_WREADY(csr_WREADY),
    .csr_WVALID(csr_WVALID),
    .csr_WDATA(csr_WDATA),
    .csr_WSTRB(csr_WSTRB),
    .csr_BREADY(csr_BREADY),
    .csr_BVALID(csr_BVALID),
    .csr_BRESP(csr_BRESP),
    .csr_ARREADY(csr_ARREADY),
    .csr_ARVALID(csr_ARVALID),
    .csr_ARADDR(csr_ARADDR),
    .csr_ARPROT(csr_ARPROT),
    .csr_RREADY(csr_RREADY),
    .csr_RVALID(csr_RVALID),
    .csr_RDATA(csr_RDATA),
    .csr_RRESP(csr_RRESP),
    .mem3_AWREADY(mem3_AWREADY),
    .mem3_AWVALID(mem3_AWVALID),
    .mem3_AWADDR(mem3_AWADDR),
    .mem3_AWSIZE(mem3_AWSIZE),
    .mem3_AWLEN(mem3_AWLEN),
    .mem3_AWBURST(mem3_AWBURST),
    .mem3_AWID(mem3_AWID),
    .mem3_AWLOCK(mem3_AWLOCK),
    .mem3_AWCACHE(mem3_AWCACHE),
    .mem3_AWPROT(mem3_AWPROT),
    .mem3_AWQOS(mem3_AWQOS),
    .mem3_WREADY(mem3_WREADY),
    .mem3_WVALID(mem3_WVALID),
    .mem3_WDATA(mem3_WDATA),
    .mem3_WSTRB(mem3_WSTRB),
    .mem3_WLAST(mem3_WLAST),
    .mem3_BREADY(mem3_BREADY),
    .mem3_BVALID(mem3_BVALID),
    .mem3_BID(mem3_BID),
    .mem3_BRESP(mem3_BRESP),
    .mem3_ARREADY(mem3_ARREADY),
    .mem3_ARVALID(mem3_ARVALID),
    .mem3_ARADDR(mem3_ARADDR),
    .mem3_ARSIZE(mem3_ARSIZE),
    .mem3_ARLEN(mem3_ARLEN),
    .mem3_ARBURST(mem3_ARBURST),
    .mem3_ARID(mem3_ARID),
    .mem3_ARLOCK(mem3_ARLOCK),
    .mem3_ARCACHE(mem3_ARCACHE),
    .mem3_ARPROT(mem3_ARPROT),
    .mem3_ARQOS(mem3_ARQOS),
    .mem3_RREADY(mem3_RREADY),
    .mem3_RVALID(mem3_RVALID),
    .mem3_RDATA(mem3_RDATA),
    .mem3_RID(mem3_RID),
    .mem3_RLAST(mem3_RLAST),
    .mem3_RRESP(mem3_RRESP),
    .mem2_AWREADY(mem2_AWREADY),
    .mem2_AWVALID(mem2_AWVALID),
    .mem2_AWADDR(mem2_AWADDR),
    .mem2_AWSIZE(mem2_AWSIZE),
    .mem2_AWLEN(mem2_AWLEN),
    .mem2_AWBURST(mem2_AWBURST),
    .mem2_AWID(mem2_AWID),
    .mem2_AWLOCK(mem2_AWLOCK),
    .mem2_AWCACHE(mem2_AWCACHE),
    .mem2_AWPROT(mem2_AWPROT),
    .mem2_AWQOS(mem2_AWQOS),
    .mem2_WREADY(mem2_WREADY),
    .mem2_WVALID(mem2_WVALID),
    .mem2_WDATA(mem2_WDATA),
    .mem2_WSTRB(mem2_WSTRB),
    .mem2_WLAST(mem2_WLAST),
    .mem2_BREADY(mem2_BREADY),
    .mem2_BVALID(mem2_BVALID),
    .mem2_BID(mem2_BID),
    .mem2_BRESP(mem2_BRESP),
    .mem2_ARREADY(mem2_ARREADY),
    .mem2_ARVALID(mem2_ARVALID),
    .mem2_ARADDR(mem2_ARADDR),
    .mem2_ARSIZE(mem2_ARSIZE),
    .mem2_ARLEN(mem2_ARLEN),
    .mem2_ARBURST(mem2_ARBURST),
    .mem2_ARID(mem2_ARID),
    .mem2_ARLOCK(mem2_ARLOCK),
    .mem2_ARCACHE(mem2_ARCACHE),
    .mem2_ARPROT(mem2_ARPROT),
    .mem2_ARQOS(mem2_ARQOS),
    .mem2_RREADY(mem2_RREADY),
    .mem2_RVALID(mem2_RVALID),
    .mem2_RDATA(mem2_RDATA),
    .mem2_RID(mem2_RID),
    .mem2_RLAST(mem2_RLAST),
    .mem2_RRESP(mem2_RRESP),
    .mem1_AWREADY(mem1_AWREADY),
    .mem1_AWVALID(mem1_AWVALID),
    .mem1_AWADDR(mem1_AWADDR),
    .mem1_AWSIZE(mem1_AWSIZE),
    .mem1_AWLEN(mem1_AWLEN),
    .mem1_AWBURST(mem1_AWBURST),
    .mem1_AWID(mem1_AWID),
    .mem1_AWLOCK(mem1_AWLOCK),
    .mem1_AWCACHE(mem1_AWCACHE),
    .mem1_AWPROT(mem1_AWPROT),
    .mem1_AWQOS(mem1_AWQOS),
    .mem1_WREADY(mem1_WREADY),
    .mem1_WVALID(mem1_WVALID),
    .mem1_WDATA(mem1_WDATA),
    .mem1_WSTRB(mem1_WSTRB),
    .mem1_WLAST(mem1_WLAST),
    .mem1_BREADY(mem1_BREADY),
    .mem1_BVALID(mem1_BVALID),
    .mem1_BID(mem1_BID),
    .mem1_BRESP(mem1_BRESP),
    .mem1_ARREADY(mem1_ARREADY),
    .mem1_ARVALID(mem1_ARVALID),
    .mem1_ARADDR(mem1_ARADDR),
    .mem1_ARSIZE(mem1_ARSIZE),
    .mem1_ARLEN(mem1_ARLEN),
    .mem1_ARBURST(mem1_ARBURST),
    .mem1_ARID(mem1_ARID),
    .mem1_ARLOCK(mem1_ARLOCK),
    .mem1_ARCACHE(mem1_ARCACHE),
    .mem1_ARPROT(mem1_ARPROT),
    .mem1_ARQOS(mem1_ARQOS),
    .mem1_RREADY(mem1_RREADY),
    .mem1_RVALID(mem1_RVALID),
    .mem1_RDATA(mem1_RDATA),
    .mem1_RID(mem1_RID),
    .mem1_RLAST(mem1_RLAST),
    .mem1_RRESP(mem1_RRESP),
    .mem0_AWREADY(mem0_AWREADY),
    .mem0_AWVALID(mem0_AWVALID),
    .mem0_AWADDR(mem0_AWADDR),
    .mem0_AWSIZE(mem0_AWSIZE),
    .mem0_AWLEN(mem0_AWLEN),
    .mem0_AWBURST(mem0_AWBURST),
    .mem0_AWID(mem0_AWID),
    .mem0_AWLOCK(mem0_AWLOCK),
    .mem0_AWCACHE(mem0_AWCACHE),
    .mem0_AWPROT(mem0_AWPROT),
    .mem0_AWQOS(mem0_AWQOS),
    .mem0_WREADY(mem0_WREADY),
    .mem0_WVALID(mem0_WVALID),
    .mem0_WDATA(mem0_WDATA),
    .mem0_WSTRB(mem0_WSTRB),
    .mem0_WLAST(mem0_WLAST),
    .mem0_BREADY(mem0_BREADY),
    .mem0_BVALID(mem0_BVALID),
    .mem0_BID(mem0_BID),
    .mem0_BRESP(mem0_BRESP),
    .mem0_ARREADY(mem0_ARREADY),
    .mem0_ARVALID(mem0_ARVALID),
    .mem0_ARADDR(mem0_ARADDR),
    .mem0_ARSIZE(mem0_ARSIZE),
    .mem0_ARLEN(mem0_ARLEN),
    .mem0_ARBURST(mem0_ARBURST),
    .mem0_ARID(mem0_ARID),
    .mem0_ARLOCK(mem0_ARLOCK),
    .mem0_ARCACHE(mem0_ARCACHE),
    .mem0_ARPROT(mem0_ARPROT),
    .mem0_ARQOS(mem0_ARQOS),
    .mem0_RREADY(mem0_RREADY),
    .mem0_RVALID(mem0_RVALID),
    .mem0_RDATA(mem0_RDATA),
    .mem0_RID(mem0_RID),
    .mem0_RLAST(mem0_RLAST),
    .mem0_RRESP(mem0_RRESP),
    .io_led(io_led),
    .io_sw(io_sw),
    .io_btn(io_btn),
    .io_tx(io_tx)
  );
endmodule
