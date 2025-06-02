
module deserializer_12bit (
    input wire clk,
    input wire clk_div,
    input wire rst,
    input wire serial_data,
    output reg [11:0] data_out
);

wire [7:0] q_master;
wire [3:0] q_slave;
wire shiftout1, shiftout2;

ISERDESE2 #(
    .DATA_RATE("DDR"),
    .DATA_WIDTH(8),
    .INTERFACE_TYPE("NETWORKING"),
    .NUM_CE(2),
    .SERDES_MODE("MASTER")
) iserdes_master (
    .D(serial_data),
    .CLK(clk),
    .CLKB(~clk),
    .CLKDIV(clk_div),
    .CE1(1'b1),
    .CE2(1'b1),
    .RST(rst),
    .Q1(q_master[7]),
    .Q2(q_master[6]),
    .Q3(q_master[5]),
    .Q4(q_master[4]),
    .Q5(q_master[3]),
    .Q6(q_master[2]),
    .Q7(q_master[1]),
    .Q8(q_master[0]),
    .SHIFTOUT1(shiftout1),
    .SHIFTOUT2(shiftout2)
);

ISERDESE2 #(
    .DATA_RATE("DDR"),
    .DATA_WIDTH(4),
    .INTERFACE_TYPE("NETWORKING"),
    .NUM_CE(2),
    .SERDES_MODE("SLAVE")
) iserdes_slave (
    .D(serial_data),
    .CLK(clk),
    .CLKB(~clk),
    .CLKDIV(clk_div),
    .CE1(1'b1),
    .CE2(1'b1),
    .RST(rst),
    .Q1(q_slave[3]),
    .Q2(q_slave[2]),
    .Q3(q_slave[1]),
    .Q4(q_slave[0]),
    .SHIFTIN1(shiftout1),
    .SHIFTIN2(shiftout2)
);

always @(posedge clk_div) begin
    if (rst) begin
        data_out <= 12'd0;
    end else begin
        data_out <= {q_slave, q_master};
    end
end

endmodule
