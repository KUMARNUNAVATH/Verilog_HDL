
// 11011 seq_detector using moore with overlapping conditions

module seq_gen (clk,reset,in,out);

input clk,reset,in;
output  out;

parameter s0=3'b000;
parameter s1=3'b001;
parameter s2=3'b010;
parameter s3=3'b011;
parameter s4=3'b100;
parameter s5=3'b101;
reg [2:0] ps,ns; // ps=present state, ns=next state;

// ps logic
always @(posedge clk or posedge reset)
  begin
   if(reset)
     ps<=s0;
   else
     ps<=ns;
end
// ns logic
always @(ps or in)
begin
case(ps)
s0: begin 
    if(in) ns=s1;
    else ns=s0;
    end

s1: begin 
    if(in) ns=s2;
    else ns=s0;
    end

s2: begin 
    if(in) ns=s2;
    else ns=s3;
    end

s3: if(in) ns=s4;
    else ns=s0;

s4: begin 
    if(in) ns=s5;
    else ns=s0;
    end

s5: begin 
    if(in) ns=s2;
    else ns=s3;
    end
default : ns=s0;
endcase
end
// we can use anyone logic for out
/*always @(ps)
begin
case(ps)
s0: out=1'b0;
s1: out=1'b0;
s2: out=1'b0;
s3: out=1'b0;
s4: out=1'b0;
s5: out=1'b1;
default : out=0;
endcase
end*/
assign out=(ps==s5);
endmodule

