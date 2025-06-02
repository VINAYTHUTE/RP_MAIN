
`timescale 1ns/1ps

module tb_top;

reg clk = 0;
reg clk_div = 0;
reg rst = 1;
reg lvds_p = 0;
reg lvds_n = 1;

wire [11:0] data_out;

top uut (
    .clk(clk),
    .clk_div(clk_div),
    .rst(rst),
    .lvds_p(lvds_p),
    .lvds_n(lvds_n),
    .data_out(data_out)
);

// 200 MHz clock
always #2.5 clk = ~clk;
// ~33.3 MHz clock
always #15 clk_div = ~clk_div;

reg [11:0] pattern = 12'b101010101010;
integer i = 0;

initial begin
    #10 rst = 0;
    forever begin
        @(posedge clk);
        lvds_p = pattern[i];
        lvds_n = ~pattern[i];
        i = (i + 1) % 12;
    end
end

initial begin
    #2000 $finish;
end

endmodule
