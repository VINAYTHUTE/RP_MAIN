
module top (
    input wire clk,
    input wire clk_div,
    input wire rst,
    input wire lvds_p,
    input wire lvds_n,
    output wire [11:0] data_out
);

wire serial_data;

IBUFDS #(
    .DIFF_TERM("TRUE"),
    .IBUF_LOW_PWR("FALSE")
) ibufds_inst (
    .I(lvds_p),
    .IB(lvds_n),
    .O(serial_data)
);

deserializer_12bit u_deserializer (
    .clk(clk),
    .clk_div(clk_div),
    .rst(rst),
    .serial_data(serial_data),
    .data_out(data_out)
);

endmodule
