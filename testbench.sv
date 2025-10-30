`timescale 1ns/1ps

module testbench;

  // Width param:
  localparam WIDTH   = 8;                
  localparam T_WIDTH = WIDTH - 1;

  // Inputs
  reg [3:0] sel_tb;
  reg [T_WIDTH:0] data_a_tb;
  reg [T_WIDTH:0] data_b_tb;

  // Output
  wire [T_WIDTH:0] data_out_tb;

  // Conect the DUT
  Param_paritysel_mux DUT (
    .sel      (sel_tb),
    .data_a   (data_a_tb),
    .data_b   (data_b_tb),
    .data_out (data_out_tb)
  );

  // Dump setup — must be at time 0
  initial begin
    $fstDumpfile("dump.fst");
    $fstDumpvars(0, testbench);
    $fstParallelon;
  end

  // Simulation sequence
  initial begin
    data_a_tb = 8'b01010101;
    data_b_tb = 8'b10101010;
    #10;

    sel_tb = 4'b0010;
    #100;

    sel_tb = 4'b0011;
    #100;

    $finish;
  end

endmodule
