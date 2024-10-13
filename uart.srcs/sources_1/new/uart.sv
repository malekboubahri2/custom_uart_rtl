`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2024 02:14:51 PM
// Design Name: 
// Module Name: uart
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uart
#(parameter DBIT = 8,
            SB_TICK = 16)
(
    input logic clk,reset,
    input logic [10:0] dvsr,
    input logic [7:0] din,
    input logic tx_start,
    input rx,
    output tx,
    output logic [7:0] dout
    );
    
    logic rx_d, tx_d;
    logic s_tick;
    
    baud_gen baud (.clk(clk), .reset(reset),.dvsr(dvsr), .tick(s_tick));
    
    uart_rx #(.DBIT(DBIT), .SB_TICK(SB_TICK)) urx
    (.clk(clk), .reset(reset),.rx(rx),.s_tick(s_tick),.rx_done_tick(rx_d),.dout(dout));
    
    uart_tx #(.DBIT(DBIT), .SB_TICK(SB_TICK)) utx
    (.clk(clk), .reset(reset),.tx_start(tx_start),.s_tick(s_tick),.din(din), .tx_done_tick(tx_d),.tx(tx));
    
endmodule
