module uart
  #(parameter
    /*
     You can specify the following three parameters.
     1. DATA_WIDTH : width of data that is transmited by this module
     2. BAUD_RATE  : baud rate of output uart signal
     3. CLK_FREQ   : freqency of input clock signal
    */
    DATA_WIDTH = 8,
    BAUD_RATE  = 115200,
    CLK_FREQ   = 100_000_000)
   (uart_if.rx   rxif,
    uart_if.tx   txif,
    input logic  clk,
    input logic  rstn);

   uart_tx #(DATA_WIDTH, BAUD_RATE, CLK_FREQ)
   uart_tx_inst(.txif(txif),     // Changed from rxif to txif
                .clk(clk),
                .rstn(rstn));

   uart_rx #(DATA_WIDTH, BAUD_RATE, CLK_FREQ)
   uart_rx_inst(.rxif(rxif),     // Changed from txif to rxif
                .clk(clk),
                .rstn(rstn));
endmodule
