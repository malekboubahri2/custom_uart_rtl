`timescale 1 ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2024 02:36:57 PM
// Design Name: 
// Module Name: uart_tb
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


module uart_tb();
    logic [7:0] dout;
    logic [7:0] din;
    logic clk, reset;
    logic [10:0] dvsr;
    logic tx_start;
    logic rx;
    logic tx;
    
    uart #(8,16) u1 (clk,reset,dvsr,din,tx_start,rx,tx,dout);
        // Clock generation: Toggle clock every 5 time units (10 units = 1 clock period)
    initial begin
      din = 8'b10101010;
      dvsr =11'b01010001010;
      tx_start = 1;
      rx = 1;
        clk = 0;              // Initialize clock to 0
        forever #10 clk = ~clk; // Toggle clock every 5 time units
    end

    // Reset generation: Assert reset for the first 10 time units
    initial begin
        reset = 1;              // Assert reset (active high) at the beginning
        #20 reset = 0;          // Deassert reset after 10 time units
    end
        initial begin
        // Simulation run for 100 time units
        #100 $stop;     // Stop the simulation after 100 time units
    end
endmodule
