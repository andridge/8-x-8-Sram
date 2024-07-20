module sram1(
    input clk,
    // 8 bits of input 
    input [7:0] data_in,
    // read write
    input wr,
    input rd,
    // for the depth is 8 memory location you need 2^3 bits of address lines
    input [2:0] add,
    // output
    output reg [7:0] data_out
);

    // define a memory array with a width of [7:0]
    reg [7:0] ram [0:7];

    // module
//write
    always @(posedge clk) begin
        if (wr)
            ram[add] <= data_in;
    end
//read
    always @(posedge clk) begin
        if (rd)
            data_out <= ram[add];
        else
            data_out <= 8'bz; // High impedance when not reading  8'b bzzzzzzzz;
    end

endmodule
