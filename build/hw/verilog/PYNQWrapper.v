module Tx(input clk, input reset,
    output io_txd,
    input [7:0] io_channel_data,
    output io_channel_ready,
    input  io_channel_valid
);

  wire T0;
  wire T1;
  reg [3:0] bitsReg;
  wire[3:0] T44;
  wire[3:0] T2;
  wire[3:0] T3;
  wire[3:0] T4;
  wire T5;
  wire T6;
  wire T7;
  reg [19:0] cntReg;
  wire[19:0] T45;
  wire[19:0] T8;
  wire[19:0] T9;
  wire[19:0] T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  reg [11:0] shiftReg;
  wire[11:0] T46;
  wire[11:0] T17;
  wire[11:0] T18;
  wire[11:0] T19;
  wire[11:0] T20;
  wire[11:0] T21;
  wire[11:0] T47;
  wire[10:0] T22;
  wire[9:0] T23;
  wire[10:0] T24;
  wire[11:0] T25;
  wire[11:0] T48;
  wire[1:0] T26;
  wire[1:0] T27;
  wire[1:0] T49;
  wire T28;
  wire T29;
  wire[9:0] T50;
  wire T51;
  wire[11:0] T30;
  wire[11:0] T52;
  wire[1:0] T31;
  wire[9:0] T53;
  wire T54;
  wire[11:0] T32;
  wire[11:0] T55;
  wire[8:0] T33;
  wire[7:0] T34;
  wire[11:0] T35;
  wire[11:0] T56;
  wire[9:0] T36;
  wire[9:0] T37;
  wire[1:0] T57;
  wire T58;
  wire[11:0] T38;
  wire[11:0] T39;
  wire[11:0] T40;
  wire[11:0] T41;
  wire T42;
  wire T43;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    bitsReg = {1{$random}};
    cntReg = {1{$random}};
    shiftReg = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_channel_ready = T0;
  assign T0 = T15 & T1;
  assign T1 = bitsReg == 4'h0;
  assign T44 = reset ? 4'h0 : T2;
  assign T2 = T12 ? 4'hb : T3;
  assign T3 = T5 ? T4 : bitsReg;
  assign T4 = bitsReg - 4'h1;
  assign T5 = T7 & T6;
  assign T6 = bitsReg != 4'h0;
  assign T7 = cntReg == 20'h0;
  assign T45 = reset ? 20'h0 : T8;
  assign T8 = T11 ? T10 : T9;
  assign T9 = T7 ? 20'h1457 : cntReg;
  assign T10 = cntReg - 20'h1;
  assign T11 = T7 ^ 1'h1;
  assign T12 = T13 & io_channel_valid;
  assign T13 = T7 & T14;
  assign T14 = T6 ^ 1'h1;
  assign T15 = cntReg == 20'h0;
  assign io_txd = T16;
  assign T16 = shiftReg[0];
  assign T46 = reset ? 12'h3f : T17;
  assign T17 = T42 ? 12'h3f : T18;
  assign T18 = T12 ? T38 : T19;
  assign T19 = T12 ? T32 : T20;
  assign T20 = T12 ? T25 : T21;
  assign T21 = T5 ? T47 : shiftReg;
  assign T47 = {1'h0, T22};
  assign T22 = {1'h1, T23};
  assign T23 = T24[9:0];
  assign T24 = shiftReg >> 1'h1;
  assign T25 = T30 | T48;
  assign T48 = {T50, T26};
  assign T26 = T49 & T27;
  assign T27 = 2'h1;
  assign T49 = T28 ? 2'h3 : 2'h0;
  assign T28 = T29;
  assign T29 = 1'h0;
  assign T50 = T51 ? 10'h3ff : 10'h0;
  assign T51 = T26[1];
  assign T30 = T21 & T52;
  assign T52 = {T53, T31};
  assign T31 = ~ T27;
  assign T53 = T54 ? 10'h3ff : 10'h0;
  assign T54 = T31[1];
  assign T32 = T35 | T55;
  assign T55 = {3'h0, T33};
  assign T33 = T34 << 1'h1;
  assign T34 = io_channel_data & 8'hff;
  assign T35 = T20 & T56;
  assign T56 = {T57, T36};
  assign T36 = ~ T37;
  assign T37 = 10'h1fe;
  assign T57 = T58 ? 2'h3 : 2'h0;
  assign T58 = T36[9];
  assign T38 = T39 | 12'h600;
  assign T39 = T19 & T40;
  assign T40 = ~ T41;
  assign T41 = 12'h600;
  assign T42 = T13 & T43;
  assign T43 = io_channel_valid ^ 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      bitsReg <= 4'h0;
    end else if(T12) begin
      bitsReg <= 4'hb;
    end else if(T5) begin
      bitsReg <= T4;
    end
    if(reset) begin
      cntReg <= 20'h0;
    end else if(T11) begin
      cntReg <= T10;
    end else if(T7) begin
      cntReg <= 20'h1457;
    end
    if(reset) begin
      shiftReg <= 12'h3f;
    end else if(T42) begin
      shiftReg <= 12'h3f;
    end else if(T12) begin
      shiftReg <= T38;
    end else if(T12) begin
      shiftReg <= T32;
    end else if(T12) begin
      shiftReg <= T25;
    end else if(T5) begin
      shiftReg <= T47;
    end
  end
endmodule

module Buffer(input clk, input reset,
    input [7:0] io_in_data,
    output io_in_ready,
    input  io_in_valid,
    output[7:0] io_out_data,
    input  io_out_ready,
    output io_out_valid
);

  wire T0;
  reg  stateReg;
  wire T9;
  wire T1;
  wire T2;
  wire T3;
  wire T4;
  wire T5;
  wire T6;
  reg [7:0] dataReg;
  wire[7:0] T10;
  wire[7:0] T7;
  wire T8;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    stateReg = {1{$random}};
    dataReg = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_out_valid = T0;
  assign T0 = stateReg == 1'h1;
  assign T9 = reset ? 1'h0 : T1;
  assign T1 = T5 ? 1'h0 : T2;
  assign T2 = T3 ? 1'h1 : stateReg;
  assign T3 = T4 & io_in_valid;
  assign T4 = stateReg == 1'h0;
  assign T5 = T6 & io_out_ready;
  assign T6 = T4 ^ 1'h1;
  assign io_out_data = dataReg;
  assign T10 = reset ? 8'h0 : T7;
  assign T7 = T3 ? io_in_data : dataReg;
  assign io_in_ready = T8;
  assign T8 = stateReg == 1'h0;

  always @(posedge clk) begin
    if(reset) begin
      stateReg <= 1'h0;
    end else if(T5) begin
      stateReg <= 1'h0;
    end else if(T3) begin
      stateReg <= 1'h1;
    end
    if(reset) begin
      dataReg <= 8'h0;
    end else if(T3) begin
      dataReg <= io_in_data;
    end
  end
endmodule

module BufferedTx(input clk, input reset,
    output io_txd,
    input [7:0] io_channel_data,
    output io_channel_ready,
    input  io_channel_valid
);

  wire tx_io_txd;
  wire tx_io_channel_ready;
  wire buf__io_in_ready;
  wire[7:0] buf__io_out_data;
  wire buf__io_out_valid;


  assign io_channel_ready = buf__io_in_ready;
  assign io_txd = tx_io_txd;
  Tx tx(.clk(clk), .reset(reset),
       .io_txd( tx_io_txd ),
       .io_channel_data( buf__io_out_data ),
       .io_channel_ready( tx_io_channel_ready ),
       .io_channel_valid( buf__io_out_valid )
  );
  Buffer buf_(.clk(clk), .reset(reset),
       .io_in_data( io_channel_data ),
       .io_in_ready( buf__io_in_ready ),
       .io_in_valid( io_channel_valid ),
       .io_out_data( buf__io_out_data ),
       .io_out_ready( tx_io_channel_ready ),
       .io_out_valid( buf__io_out_valid )
  );
endmodule

module Sender(input clk, input reset,
    output io_txd,
    input [7:0] io_data,
    input  io_start,
    output io_done
);

  wire T0;
  reg [1:0] state;
  wire[1:0] T10;
  wire[1:0] T1;
  wire[1:0] T2;
  wire[1:0] T3;
  wire T4;
  wire T5;
  wire T6;
  wire T7;
  wire T8;
  wire T9;
  wire tx_io_txd;
  wire tx_io_channel_ready;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    state = {1{$random}};
  end
// synthesis translate_on
`endif

  assign T0 = 2'h1 == state;
  assign T10 = reset ? 2'h0 : T1;
  assign T1 = T7 ? 2'h0 : T2;
  assign T2 = T6 ? 2'h2 : T3;
  assign T3 = T4 ? 2'h1 : state;
  assign T4 = T5 & io_start;
  assign T5 = 2'h0 == state;
  assign T6 = T0 & tx_io_channel_ready;
  assign T7 = T9 & T8;
  assign T8 = io_start ^ 1'h1;
  assign T9 = 2'h2 == state;
  assign io_done = T9;
  assign io_txd = tx_io_txd;
  BufferedTx tx(.clk(clk), .reset(reset),
       .io_txd( tx_io_txd ),
       .io_channel_data( io_data ),
       .io_channel_ready( tx_io_channel_ready ),
       .io_channel_valid( T0 )
  );

  always @(posedge clk) begin
    if(reset) begin
      state <= 2'h0;
    end else if(T7) begin
      state <= 2'h0;
    end else if(T6) begin
      state <= 2'h2;
    end else if(T4) begin
      state <= 2'h1;
    end
  end
endmodule

module TestUART(input clk, input reset,
    output[31:0] io_signature,
    output[3:0] io_led,
    input [1:0] io_sw,
    input [3:0] io_btn,
    output io_tx,
    input [7:0] io_data,
    input  io_start,
    output io_done
);

  wire Sender_io_txd;
  wire Sender_io_done;


`ifndef SYNTHESIS
// synthesis translate_off
  assign io_led = {1{$random}};
  assign io_signature = {1{$random}};
// synthesis translate_on
`endif
  assign io_done = Sender_io_done;
  assign io_tx = Sender_io_txd;
  Sender Sender(.clk(clk), .reset(reset),
       .io_txd( Sender_io_txd ),
       .io_data( io_data ),
       .io_start( io_start ),
       .io_done( Sender_io_done )
  );
endmodule

module RegFile(input clk, input reset,
    input  io_extIF_cmd_valid,
    input [2:0] io_extIF_cmd_bits_regID,
    input  io_extIF_cmd_bits_read,
    input  io_extIF_cmd_bits_write,
    input [31:0] io_extIF_cmd_bits_writeData,
    output io_extIF_readData_valid,
    output[31:0] io_extIF_readData_bits,
    output[2:0] io_extIF_regCount,
    output[31:0] io_regOut_7,
    output[31:0] io_regOut_6,
    output[31:0] io_regOut_5,
    output[31:0] io_regOut_4,
    output[31:0] io_regOut_3,
    output[31:0] io_regOut_2,
    output[31:0] io_regOut_1,
    output[31:0] io_regOut_0,
    input  io_regIn_7_valid,
    input [31:0] io_regIn_7_bits,
    input  io_regIn_6_valid,
    input [31:0] io_regIn_6_bits,
    input  io_regIn_5_valid,
    input [31:0] io_regIn_5_bits,
    input  io_regIn_4_valid,
    input [31:0] io_regIn_4_bits,
    input  io_regIn_3_valid,
    input [31:0] io_regIn_3_bits,
    input  io_regIn_2_valid,
    input [31:0] io_regIn_2_bits,
    input  io_regIn_1_valid,
    input [31:0] io_regIn_1_bits,
    input  io_regIn_0_valid,
    input [31:0] io_regIn_0_bits
);

  reg [31:0] regFile_0;
  wire[31:0] T59;
  wire[31:0] T0;
  wire[31:0] T1;
  reg [31:0] regCommand_writeData;
  wire T2;
  wire T3;
  wire[7:0] T4;
  wire[2:0] T5;
  reg [2:0] regCommand_regID;
  wire hasExtWriteCommand;
  reg  regCommand_write;
  reg  regDoCmd;
  wire T60;
  wire T6;
  wire T7;
  reg [31:0] regFile_1;
  wire[31:0] T61;
  wire[31:0] T8;
  wire[31:0] T9;
  wire T10;
  wire T11;
  wire T12;
  reg [31:0] regFile_2;
  wire[31:0] T62;
  wire[31:0] T13;
  wire[31:0] T14;
  wire T15;
  wire T16;
  wire T17;
  reg [31:0] regFile_3;
  wire[31:0] T63;
  wire[31:0] T18;
  wire[31:0] T19;
  wire T20;
  wire T21;
  wire T22;
  reg [31:0] regFile_4;
  wire[31:0] T64;
  wire[31:0] T23;
  wire[31:0] T24;
  wire T25;
  wire T26;
  wire T27;
  reg [31:0] regFile_5;
  wire[31:0] T65;
  wire[31:0] T28;
  wire[31:0] T29;
  wire T30;
  wire T31;
  wire T32;
  reg [31:0] regFile_6;
  wire[31:0] T66;
  wire[31:0] T33;
  wire[31:0] T34;
  wire T35;
  wire T36;
  wire T37;
  reg [31:0] regFile_7;
  wire[31:0] T67;
  wire[31:0] T38;
  wire[31:0] T39;
  wire T40;
  wire T41;
  wire T42;
  wire[31:0] T43;
  wire[31:0] T44;
  wire[31:0] T45;
  wire[31:0] T46;
  wire T47;
  wire[31:0] T48;
  wire T49;
  wire T50;
  wire[31:0] T51;
  wire[31:0] T52;
  wire T53;
  wire[31:0] T54;
  wire T55;
  wire T56;
  wire T57;
  wire T58;
  wire[3:0] T68;
  wire hasExtReadCommand;
  reg  regCommand_read;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    regFile_0 = {1{$random}};
    regCommand_writeData = {1{$random}};
    regCommand_regID = {1{$random}};
    regCommand_write = {1{$random}};
    regDoCmd = {1{$random}};
    regFile_1 = {1{$random}};
    regFile_2 = {1{$random}};
    regFile_3 = {1{$random}};
    regFile_4 = {1{$random}};
    regFile_5 = {1{$random}};
    regFile_6 = {1{$random}};
    regFile_7 = {1{$random}};
    regCommand_read = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_regOut_0 = regFile_0;
  assign T59 = reset ? 32'h0 : T0;
  assign T0 = T6 ? io_regIn_0_bits : T1;
  assign T1 = T2 ? regCommand_writeData : regFile_0;
  assign T2 = hasExtWriteCommand & T3;
  assign T3 = T4[0];
  assign T4 = 1'h1 << T5;
  assign T5 = regCommand_regID;
  assign hasExtWriteCommand = regDoCmd & regCommand_write;
  assign T60 = reset ? 1'h0 : io_extIF_cmd_valid;
  assign T6 = T7 & io_regIn_0_valid;
  assign T7 = hasExtWriteCommand ^ 1'h1;
  assign io_regOut_1 = regFile_1;
  assign T61 = reset ? 32'h0 : T8;
  assign T8 = T12 ? io_regIn_1_bits : T9;
  assign T9 = T10 ? regCommand_writeData : regFile_1;
  assign T10 = hasExtWriteCommand & T11;
  assign T11 = T4[1];
  assign T12 = T7 & io_regIn_1_valid;
  assign io_regOut_2 = regFile_2;
  assign T62 = reset ? 32'h0 : T13;
  assign T13 = T17 ? io_regIn_2_bits : T14;
  assign T14 = T15 ? regCommand_writeData : regFile_2;
  assign T15 = hasExtWriteCommand & T16;
  assign T16 = T4[2];
  assign T17 = T7 & io_regIn_2_valid;
  assign io_regOut_3 = regFile_3;
  assign T63 = reset ? 32'h0 : T18;
  assign T18 = T22 ? io_regIn_3_bits : T19;
  assign T19 = T20 ? regCommand_writeData : regFile_3;
  assign T20 = hasExtWriteCommand & T21;
  assign T21 = T4[3];
  assign T22 = T7 & io_regIn_3_valid;
  assign io_regOut_4 = regFile_4;
  assign T64 = reset ? 32'h0 : T23;
  assign T23 = T27 ? io_regIn_4_bits : T24;
  assign T24 = T25 ? regCommand_writeData : regFile_4;
  assign T25 = hasExtWriteCommand & T26;
  assign T26 = T4[4];
  assign T27 = T7 & io_regIn_4_valid;
  assign io_regOut_5 = regFile_5;
  assign T65 = reset ? 32'h0 : T28;
  assign T28 = T32 ? io_regIn_5_bits : T29;
  assign T29 = T30 ? regCommand_writeData : regFile_5;
  assign T30 = hasExtWriteCommand & T31;
  assign T31 = T4[5];
  assign T32 = T7 & io_regIn_5_valid;
  assign io_regOut_6 = regFile_6;
  assign T66 = reset ? 32'h0 : T33;
  assign T33 = T37 ? io_regIn_6_bits : T34;
  assign T34 = T35 ? regCommand_writeData : regFile_6;
  assign T35 = hasExtWriteCommand & T36;
  assign T36 = T4[6];
  assign T37 = T7 & io_regIn_6_valid;
  assign io_regOut_7 = regFile_7;
  assign T67 = reset ? 32'h0 : T38;
  assign T38 = T42 ? io_regIn_7_bits : T39;
  assign T39 = T40 ? regCommand_writeData : regFile_7;
  assign T40 = hasExtWriteCommand & T41;
  assign T41 = T4[7];
  assign T42 = T7 & io_regIn_7_valid;
  assign io_extIF_regCount = 3'h0;
  assign io_extIF_readData_bits = T43;
  assign T43 = T58 ? T44 : 32'h0;
  assign T44 = T57 ? T51 : T45;
  assign T45 = T50 ? T48 : T46;
  assign T46 = T47 ? regFile_1 : regFile_0;
  assign T47 = T5[0];
  assign T48 = T49 ? regFile_3 : regFile_2;
  assign T49 = T5[0];
  assign T50 = T5[1];
  assign T51 = T56 ? T54 : T52;
  assign T52 = T53 ? regFile_5 : regFile_4;
  assign T53 = T5[0];
  assign T54 = T55 ? regFile_7 : regFile_6;
  assign T55 = T5[0];
  assign T56 = T5[1];
  assign T57 = T5[2];
  assign T58 = T68 < 4'h8;
  assign T68 = {1'h0, regCommand_regID};
  assign io_extIF_readData_valid = hasExtReadCommand;
  assign hasExtReadCommand = regDoCmd & regCommand_read;

  always @(posedge clk) begin
    if(reset) begin
      regFile_0 <= 32'h0;
    end else if(T6) begin
      regFile_0 <= io_regIn_0_bits;
    end else if(T2) begin
      regFile_0 <= regCommand_writeData;
    end
    regCommand_writeData <= io_extIF_cmd_bits_writeData;
    regCommand_regID <= io_extIF_cmd_bits_regID;
    regCommand_write <= io_extIF_cmd_bits_write;
    if(reset) begin
      regDoCmd <= 1'h0;
    end else begin
      regDoCmd <= io_extIF_cmd_valid;
    end
    if(reset) begin
      regFile_1 <= 32'h0;
    end else if(T12) begin
      regFile_1 <= io_regIn_1_bits;
    end else if(T10) begin
      regFile_1 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_2 <= 32'h0;
    end else if(T17) begin
      regFile_2 <= io_regIn_2_bits;
    end else if(T15) begin
      regFile_2 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_3 <= 32'h0;
    end else if(T22) begin
      regFile_3 <= io_regIn_3_bits;
    end else if(T20) begin
      regFile_3 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_4 <= 32'h0;
    end else if(T27) begin
      regFile_4 <= io_regIn_4_bits;
    end else if(T25) begin
      regFile_4 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_5 <= 32'h0;
    end else if(T32) begin
      regFile_5 <= io_regIn_5_bits;
    end else if(T30) begin
      regFile_5 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_6 <= 32'h0;
    end else if(T37) begin
      regFile_6 <= io_regIn_6_bits;
    end else if(T35) begin
      regFile_6 <= regCommand_writeData;
    end
    if(reset) begin
      regFile_7 <= 32'h0;
    end else if(T42) begin
      regFile_7 <= io_regIn_7_bits;
    end else if(T40) begin
      regFile_7 <= regCommand_writeData;
    end
    regCommand_read <= io_extIF_cmd_bits_read;
  end
endmodule

module PYNQWrapper(input clk, input reset,
    output csr_AWREADY,
    input  csr_AWVALID,
    input [31:0] csr_AWADDR,
    input [2:0] csr_AWPROT,
    output csr_WREADY,
    input  csr_WVALID,
    input [31:0] csr_WDATA,
    input [3:0] csr_WSTRB,
    input  csr_BREADY,
    output csr_BVALID,
    output[1:0] csr_BRESP,
    output csr_ARREADY,
    input  csr_ARVALID,
    input [31:0] csr_ARADDR,
    input [2:0] csr_ARPROT,
    input  csr_RREADY,
    output csr_RVALID,
    output[31:0] csr_RDATA,
    output[1:0] csr_RRESP,
    input  mem3_AWREADY,
    output mem3_AWVALID,
    output[31:0] mem3_AWADDR,
    output[2:0] mem3_AWSIZE,
    output[7:0] mem3_AWLEN,
    output[1:0] mem3_AWBURST,
    output[5:0] mem3_AWID,
    output mem3_AWLOCK,
    output[3:0] mem3_AWCACHE,
    output[2:0] mem3_AWPROT,
    output[3:0] mem3_AWQOS,
    input  mem3_WREADY,
    output mem3_WVALID,
    output[63:0] mem3_WDATA,
    output[7:0] mem3_WSTRB,
    output mem3_WLAST,
    output mem3_BREADY,
    input  mem3_BVALID,
    input [5:0] mem3_BID,
    input [1:0] mem3_BRESP,
    input  mem3_ARREADY,
    output mem3_ARVALID,
    output[31:0] mem3_ARADDR,
    output[2:0] mem3_ARSIZE,
    output[7:0] mem3_ARLEN,
    output[1:0] mem3_ARBURST,
    output[5:0] mem3_ARID,
    output mem3_ARLOCK,
    output[3:0] mem3_ARCACHE,
    output[2:0] mem3_ARPROT,
    output[3:0] mem3_ARQOS,
    output mem3_RREADY,
    input  mem3_RVALID,
    input [63:0] mem3_RDATA,
    input [5:0] mem3_RID,
    input  mem3_RLAST,
    input [1:0] mem3_RRESP,
    input  mem2_AWREADY,
    output mem2_AWVALID,
    output[31:0] mem2_AWADDR,
    output[2:0] mem2_AWSIZE,
    output[7:0] mem2_AWLEN,
    output[1:0] mem2_AWBURST,
    output[5:0] mem2_AWID,
    output mem2_AWLOCK,
    output[3:0] mem2_AWCACHE,
    output[2:0] mem2_AWPROT,
    output[3:0] mem2_AWQOS,
    input  mem2_WREADY,
    output mem2_WVALID,
    output[63:0] mem2_WDATA,
    output[7:0] mem2_WSTRB,
    output mem2_WLAST,
    output mem2_BREADY,
    input  mem2_BVALID,
    input [5:0] mem2_BID,
    input [1:0] mem2_BRESP,
    input  mem2_ARREADY,
    output mem2_ARVALID,
    output[31:0] mem2_ARADDR,
    output[2:0] mem2_ARSIZE,
    output[7:0] mem2_ARLEN,
    output[1:0] mem2_ARBURST,
    output[5:0] mem2_ARID,
    output mem2_ARLOCK,
    output[3:0] mem2_ARCACHE,
    output[2:0] mem2_ARPROT,
    output[3:0] mem2_ARQOS,
    output mem2_RREADY,
    input  mem2_RVALID,
    input [63:0] mem2_RDATA,
    input [5:0] mem2_RID,
    input  mem2_RLAST,
    input [1:0] mem2_RRESP,
    input  mem1_AWREADY,
    output mem1_AWVALID,
    output[31:0] mem1_AWADDR,
    output[2:0] mem1_AWSIZE,
    output[7:0] mem1_AWLEN,
    output[1:0] mem1_AWBURST,
    output[5:0] mem1_AWID,
    output mem1_AWLOCK,
    output[3:0] mem1_AWCACHE,
    output[2:0] mem1_AWPROT,
    output[3:0] mem1_AWQOS,
    input  mem1_WREADY,
    output mem1_WVALID,
    output[63:0] mem1_WDATA,
    output[7:0] mem1_WSTRB,
    output mem1_WLAST,
    output mem1_BREADY,
    input  mem1_BVALID,
    input [5:0] mem1_BID,
    input [1:0] mem1_BRESP,
    input  mem1_ARREADY,
    output mem1_ARVALID,
    output[31:0] mem1_ARADDR,
    output[2:0] mem1_ARSIZE,
    output[7:0] mem1_ARLEN,
    output[1:0] mem1_ARBURST,
    output[5:0] mem1_ARID,
    output mem1_ARLOCK,
    output[3:0] mem1_ARCACHE,
    output[2:0] mem1_ARPROT,
    output[3:0] mem1_ARQOS,
    output mem1_RREADY,
    input  mem1_RVALID,
    input [63:0] mem1_RDATA,
    input [5:0] mem1_RID,
    input  mem1_RLAST,
    input [1:0] mem1_RRESP,
    input  mem0_AWREADY,
    output mem0_AWVALID,
    output[31:0] mem0_AWADDR,
    output[2:0] mem0_AWSIZE,
    output[7:0] mem0_AWLEN,
    output[1:0] mem0_AWBURST,
    output[5:0] mem0_AWID,
    output mem0_AWLOCK,
    output[3:0] mem0_AWCACHE,
    output[2:0] mem0_AWPROT,
    output[3:0] mem0_AWQOS,
    input  mem0_WREADY,
    output mem0_WVALID,
    output[63:0] mem0_WDATA,
    output[7:0] mem0_WSTRB,
    output mem0_WLAST,
    output mem0_BREADY,
    input  mem0_BVALID,
    input [5:0] mem0_BID,
    input [1:0] mem0_BRESP,
    input  mem0_ARREADY,
    output mem0_ARVALID,
    output[31:0] mem0_ARADDR,
    output[2:0] mem0_ARSIZE,
    output[7:0] mem0_ARLEN,
    output[1:0] mem0_ARBURST,
    output[5:0] mem0_ARID,
    output mem0_ARLOCK,
    output[3:0] mem0_ARCACHE,
    output[2:0] mem0_ARPROT,
    output[3:0] mem0_ARQOS,
    output mem0_RREADY,
    input  mem0_RVALID,
    input [63:0] mem0_RDATA,
    input [5:0] mem0_RID,
    input  mem0_RLAST,
    input [1:0] mem0_RRESP,
    output[3:0] io_led,
    input [1:0] io_sw,
    input [3:0] io_btn,
    output io_tx
);

  wire T43;
  reg  regWrapperReset;
  wire T44;
  wire T45;
  wire T46;
  wire T47;
  wire T48;
  wire[31:0] T49;
  wire[31:0] T50;
  wire[31:0] T51;
  wire[31:0] T0;
  reg [31:0] regWrData;
  wire[31:0] T52;
  wire[31:0] T1;
  wire T2;
  wire T3;
  reg [2:0] regState;
  wire[2:0] T53;
  wire[2:0] T4;
  wire[2:0] T5;
  wire[2:0] T6;
  wire[2:0] T7;
  wire[2:0] T8;
  wire[2:0] T9;
  wire[2:0] T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  wire T24;
  wire T25;
  reg  regModeWrite;
  wire T54;
  wire T26;
  wire T27;
  wire[2:0] T55;
  wire[31:0] T28;
  wire[31:0] T29;
  wire[31:0] T30;
  reg [31:0] regRdAddr;
  wire[31:0] T56;
  wire[31:0] T31;
  wire[31:0] T32;
  reg [31:0] regWrAddr;
  wire[31:0] T57;
  wire[31:0] T33;
  wire T34;
  wire T35;
  reg  regRdReq;
  wire T58;
  wire T36;
  wire T37;
  reg  regWrReq;
  wire T59;
  wire T38;
  wire T39;
  wire T40;
  wire T41;
  wire[7:0] T60;
  wire T42;
  wire RegFile_io_extIF_readData_valid;
  wire[31:0] RegFile_io_extIF_readData_bits;
  wire[31:0] RegFile_io_regOut_5;
  wire[31:0] RegFile_io_regOut_2;
  wire[31:0] TestUART_io_signature;
  wire[3:0] TestUART_io_led;
  wire TestUART_io_tx;
  wire TestUART_io_done;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    regWrapperReset = {1{$random}};
    regWrData = {1{$random}};
    regState = {1{$random}};
    regModeWrite = {1{$random}};
    regRdAddr = {1{$random}};
    regWrAddr = {1{$random}};
    regRdReq = {1{$random}};
    regWrReq = {1{$random}};
  end
// synthesis translate_on
`endif

  assign T43 = reset | regWrapperReset;
  assign T44 = T46 ? T45 : regWrapperReset;
  assign T45 = T0[0];
  assign T46 = T48 & T47;
  assign T47 = T55 == 3'h0;
  assign T48 = T34 & T24;
  assign T49 = {31'h0, TestUART_io_done};
  assign T50 = {28'h0, TestUART_io_led};
  assign T51 = {31'h0, TestUART_io_tx};
  assign T0 = T24 ? regWrData : 32'h0;
  assign T52 = reset ? 32'h0 : T1;
  assign T1 = T2 ? csr_WDATA : regWrData;
  assign T2 = T3 & csr_WVALID;
  assign T3 = 3'h3 == regState;
  assign T53 = reset ? 3'h0 : T4;
  assign T4 = T22 ? 3'h0 : T5;
  assign T5 = T2 ? 3'h4 : T6;
  assign T6 = T20 ? 3'h0 : T7;
  assign T7 = T18 ? 3'h3 : T8;
  assign T8 = T15 ? 3'h2 : T9;
  assign T9 = T13 ? 3'h2 : T10;
  assign T10 = T11 ? 3'h1 : regState;
  assign T11 = T12 & csr_ARVALID;
  assign T12 = 3'h0 == regState;
  assign T13 = T12 & T14;
  assign T14 = csr_ARVALID ^ 1'h1;
  assign T15 = T17 & T16;
  assign T16 = csr_RREADY & RegFile_io_extIF_readData_valid;
  assign T17 = 3'h1 == regState;
  assign T18 = T19 & csr_AWVALID;
  assign T19 = 3'h2 == regState;
  assign T20 = T19 & T21;
  assign T21 = csr_AWVALID ^ 1'h1;
  assign T22 = T23 & csr_BREADY;
  assign T23 = 3'h4 == regState;
  assign T24 = T25 ^ 1'h1;
  assign T25 = regModeWrite ^ 1'h1;
  assign T54 = reset ? 1'h0 : T26;
  assign T26 = T18 ? 1'h1 : T27;
  assign T27 = T11 ? 1'h0 : regModeWrite;
  assign T55 = T28[2:0];
  assign T28 = T24 ? T32 : T29;
  assign T29 = T25 ? T30 : 32'h0;
  assign T30 = regRdAddr / 3'h4;
  assign T56 = reset ? 32'h0 : T31;
  assign T31 = T11 ? csr_ARADDR : regRdAddr;
  assign T32 = regWrAddr / 3'h4;
  assign T57 = reset ? 32'h0 : T33;
  assign T33 = T18 ? csr_AWADDR : regWrAddr;
  assign T34 = T24 ? regWrReq : T35;
  assign T35 = T25 ? regRdReq : 1'h0;
  assign T58 = reset ? 1'h0 : T36;
  assign T36 = T15 ? 1'h0 : T37;
  assign T37 = T11 ? 1'h1 : regRdReq;
  assign T59 = reset ? 1'h0 : T38;
  assign T38 = T22 ? 1'h0 : T39;
  assign T39 = T2 ? 1'h1 : T40;
  assign T40 = T18 ? 1'h0 : regWrReq;
  assign T41 = RegFile_io_regOut_5[0];
  assign T60 = RegFile_io_regOut_2[7:0];
  assign io_tx = TestUART_io_tx;
  assign io_led = TestUART_io_led;
  assign mem0_RREADY = 1'h0;
  assign mem0_ARQOS = 4'h0;
  assign mem0_ARPROT = 3'h0;
  assign mem0_ARCACHE = 4'h0;
  assign mem0_ARLOCK = 1'h0;
  assign mem0_ARID = 6'h0;
  assign mem0_ARBURST = 2'h0;
  assign mem0_ARLEN = 8'h0;
  assign mem0_ARSIZE = 3'h0;
  assign mem0_ARADDR = 32'h0;
  assign mem0_ARVALID = 1'h0;
  assign mem0_BREADY = 1'h0;
  assign mem0_WLAST = 1'h0;
  assign mem0_WSTRB = 8'h0;
  assign mem0_WDATA = 64'h0;
  assign mem0_WVALID = 1'h0;
  assign mem0_AWQOS = 4'h0;
  assign mem0_AWPROT = 3'h0;
  assign mem0_AWCACHE = 4'h0;
  assign mem0_AWLOCK = 1'h0;
  assign mem0_AWID = 6'h0;
  assign mem0_AWBURST = 2'h0;
  assign mem0_AWLEN = 8'h0;
  assign mem0_AWSIZE = 3'h0;
  assign mem0_AWADDR = 32'h0;
  assign mem0_AWVALID = 1'h0;
  assign mem1_RREADY = 1'h0;
  assign mem1_ARQOS = 4'h0;
  assign mem1_ARPROT = 3'h0;
  assign mem1_ARCACHE = 4'h0;
  assign mem1_ARLOCK = 1'h0;
  assign mem1_ARID = 6'h0;
  assign mem1_ARBURST = 2'h0;
  assign mem1_ARLEN = 8'h0;
  assign mem1_ARSIZE = 3'h0;
  assign mem1_ARADDR = 32'h0;
  assign mem1_ARVALID = 1'h0;
  assign mem1_BREADY = 1'h0;
  assign mem1_WLAST = 1'h0;
  assign mem1_WSTRB = 8'h0;
  assign mem1_WDATA = 64'h0;
  assign mem1_WVALID = 1'h0;
  assign mem1_AWQOS = 4'h0;
  assign mem1_AWPROT = 3'h0;
  assign mem1_AWCACHE = 4'h0;
  assign mem1_AWLOCK = 1'h0;
  assign mem1_AWID = 6'h0;
  assign mem1_AWBURST = 2'h0;
  assign mem1_AWLEN = 8'h0;
  assign mem1_AWSIZE = 3'h0;
  assign mem1_AWADDR = 32'h0;
  assign mem1_AWVALID = 1'h0;
  assign mem2_RREADY = 1'h0;
  assign mem2_ARQOS = 4'h0;
  assign mem2_ARPROT = 3'h0;
  assign mem2_ARCACHE = 4'h0;
  assign mem2_ARLOCK = 1'h0;
  assign mem2_ARID = 6'h0;
  assign mem2_ARBURST = 2'h0;
  assign mem2_ARLEN = 8'h0;
  assign mem2_ARSIZE = 3'h0;
  assign mem2_ARADDR = 32'h0;
  assign mem2_ARVALID = 1'h0;
  assign mem2_BREADY = 1'h0;
  assign mem2_WLAST = 1'h0;
  assign mem2_WSTRB = 8'h0;
  assign mem2_WDATA = 64'h0;
  assign mem2_WVALID = 1'h0;
  assign mem2_AWQOS = 4'h0;
  assign mem2_AWPROT = 3'h0;
  assign mem2_AWCACHE = 4'h0;
  assign mem2_AWLOCK = 1'h0;
  assign mem2_AWID = 6'h0;
  assign mem2_AWBURST = 2'h0;
  assign mem2_AWLEN = 8'h0;
  assign mem2_AWSIZE = 3'h0;
  assign mem2_AWADDR = 32'h0;
  assign mem2_AWVALID = 1'h0;
  assign mem3_RREADY = 1'h0;
  assign mem3_ARQOS = 4'h0;
  assign mem3_ARPROT = 3'h0;
  assign mem3_ARCACHE = 4'h0;
  assign mem3_ARLOCK = 1'h0;
  assign mem3_ARID = 6'h0;
  assign mem3_ARBURST = 2'h0;
  assign mem3_ARLEN = 8'h0;
  assign mem3_ARSIZE = 3'h0;
  assign mem3_ARADDR = 32'h0;
  assign mem3_ARVALID = 1'h0;
  assign mem3_BREADY = 1'h0;
  assign mem3_WLAST = 1'h0;
  assign mem3_WSTRB = 8'h0;
  assign mem3_WDATA = 64'h0;
  assign mem3_WVALID = 1'h0;
  assign mem3_AWQOS = 4'h0;
  assign mem3_AWPROT = 3'h0;
  assign mem3_AWCACHE = 4'h0;
  assign mem3_AWLOCK = 1'h0;
  assign mem3_AWID = 6'h0;
  assign mem3_AWBURST = 2'h0;
  assign mem3_AWLEN = 8'h0;
  assign mem3_AWSIZE = 3'h0;
  assign mem3_AWADDR = 32'h0;
  assign mem3_AWVALID = 1'h0;
  assign csr_RRESP = 2'h0;
  assign csr_RDATA = RegFile_io_extIF_readData_bits;
  assign csr_RVALID = T42;
  assign T42 = T17 ? RegFile_io_extIF_readData_valid : 1'h0;
  assign csr_ARREADY = T12;
  assign csr_BRESP = 2'h0;
  assign csr_BVALID = T23;
  assign csr_WREADY = T3;
  assign csr_AWREADY = T19;
  TestUART TestUART(.clk(clk), .reset(T43),
       .io_signature( TestUART_io_signature ),
       .io_led( TestUART_io_led ),
       .io_sw( io_sw ),
       .io_btn( io_btn ),
       .io_tx( TestUART_io_tx ),
       .io_data( T60 ),
       .io_start( T41 ),
       .io_done( TestUART_io_done )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign TestUART.io_signature = {1{$random}};
    assign TestUART.io_led = {1{$random}};
// synthesis translate_on
`endif
  RegFile RegFile(.clk(clk), .reset(reset),
       .io_extIF_cmd_valid( T34 ),
       .io_extIF_cmd_bits_regID( T55 ),
       .io_extIF_cmd_bits_read( T25 ),
       .io_extIF_cmd_bits_write( T24 ),
       .io_extIF_cmd_bits_writeData( T0 ),
       .io_extIF_readData_valid( RegFile_io_extIF_readData_valid ),
       .io_extIF_readData_bits( RegFile_io_extIF_readData_bits ),
       //.io_extIF_regCount(  )
       //.io_regOut_7(  )
       //.io_regOut_6(  )
       .io_regOut_5( RegFile_io_regOut_5 ),
       //.io_regOut_4(  )
       //.io_regOut_3(  )
       .io_regOut_2( RegFile_io_regOut_2 ),
       //.io_regOut_1(  )
       //.io_regOut_0(  )
       .io_regIn_7_valid( 1'h1 ),
       .io_regIn_7_bits( T51 ),
       .io_regIn_6_valid( 1'h0 ),
       //.io_regIn_6_bits(  )
       .io_regIn_5_valid( 1'h0 ),
       //.io_regIn_5_bits(  )
       .io_regIn_4_valid( 1'h1 ),
       .io_regIn_4_bits( T50 ),
       .io_regIn_3_valid( 1'h1 ),
       .io_regIn_3_bits( T49 ),
       .io_regIn_2_valid( 1'h0 ),
       //.io_regIn_2_bits(  )
       .io_regIn_1_valid( 1'h0 ),
       //.io_regIn_1_bits(  )
       .io_regIn_0_valid( 1'h1 ),
       .io_regIn_0_bits( TestUART_io_signature )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign RegFile.io_regIn_6_bits = {1{$random}};
    assign RegFile.io_regIn_5_bits = {1{$random}};
    assign RegFile.io_regIn_2_bits = {1{$random}};
    assign RegFile.io_regIn_1_bits = {1{$random}};
// synthesis translate_on
`endif

  always @(posedge clk) begin
    if(T46) begin
      regWrapperReset <= T45;
    end
    if(reset) begin
      regWrData <= 32'h0;
    end else if(T2) begin
      regWrData <= csr_WDATA;
    end
    if(reset) begin
      regState <= 3'h0;
    end else if(T22) begin
      regState <= 3'h0;
    end else if(T2) begin
      regState <= 3'h4;
    end else if(T20) begin
      regState <= 3'h0;
    end else if(T18) begin
      regState <= 3'h3;
    end else if(T15) begin
      regState <= 3'h2;
    end else if(T13) begin
      regState <= 3'h2;
    end else if(T11) begin
      regState <= 3'h1;
    end
    if(reset) begin
      regModeWrite <= 1'h0;
    end else if(T18) begin
      regModeWrite <= 1'h1;
    end else if(T11) begin
      regModeWrite <= 1'h0;
    end
    if(reset) begin
      regRdAddr <= 32'h0;
    end else if(T11) begin
      regRdAddr <= csr_ARADDR;
    end
    if(reset) begin
      regWrAddr <= 32'h0;
    end else if(T18) begin
      regWrAddr <= csr_AWADDR;
    end
    if(reset) begin
      regRdReq <= 1'h0;
    end else if(T15) begin
      regRdReq <= 1'h0;
    end else if(T11) begin
      regRdReq <= 1'h1;
    end
    if(reset) begin
      regWrReq <= 1'h0;
    end else if(T22) begin
      regWrReq <= 1'h0;
    end else if(T2) begin
      regWrReq <= 1'h1;
    end else if(T18) begin
      regWrReq <= 1'h0;
    end
  end
endmodule

