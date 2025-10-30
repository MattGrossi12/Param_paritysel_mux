
module Param_paritysel_mux #(
    parameter WIDTH = 8,
    parameter T_WIDTH = (WIDTH-1)
)(
//Input:
input wire [3:0] sel,
input wire [T_WIDTH:0] data_a,
input wire [T_WIDTH:0] data_b,
//Output:
output wire [T_WIDTH:0] data_out
);
                                                 
//-------------------------------------------------------------------------------
//Logic system:
//-------------------------------------------------------------------------------

assign data_out = sel % 2 == 0 ? data_a : data_b;

endmodule


