module Nx1Mux_TB;
  parameter N = 4;
  reg [N-1:0] inputs;
  reg  select;
  wire out;
  n_to_1_mux #(N) uut (
    .inputs(inputs),
    .select(select),
    .out(out)
  );
  initial begin
    $display("N:1 MUX Testbench");
    inputs = 4'b0000;
    for (select = 0; select < N; select = select + 1) begin
      $display("Select = %b, Output = %b", select, out);
    end
    inputs = 4'b1101;
    for (select = 0; select < N; select = select + 1) begin
      $display("Select = %b, Output = %b", select, out);
    end
    $finish;
  end
endmodule