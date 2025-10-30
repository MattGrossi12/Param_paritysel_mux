module Param_paritysel_mux #(    
    parameter WIDTH = 8,
    parameter T_WIDTH = (WIDTH-1)
)(
//Input:
input logic [4:0] sel,
input logic [T_WIDTH:0] data_a,
input logic [T_WIDTH:0] data_b,
//Output:
output logic [T_WIDTH:0] data_out
);
                                                 
//-------------------------------------------------------------------------------
//Logic system:
//-------------------------------------------------------------------------------

assign data_out = sel % 2 == 0 ? data_a : data_b;

endmodule