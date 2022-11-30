module seq_gen_tb;

reg clk,reset,in;
wire out;

seq_gen DUT (clk,reset,in,out);

initial
begin
clk=1'b0;
 forever #10 clk=~clk;
end

task rst_cmd;
begin
@(negedge clk)
  reset=1'b1;
@(negedge clk)
  reset=1'b0;
end
endtask

task  seq_in(input d_in);
begin
@(negedge clk)
  in=d_in;
end
endtask

initial
begin
rst_cmd;
seq_in(0);
seq_in(1);
seq_in(1);
seq_in(0);
seq_in(1);
seq_in(1);
seq_in(0);
seq_in(1);
seq_in(1);
seq_in(1);
seq_in(0);
seq_in(0);
#300;
 $finish;
end

endmodule

