
module DFF(clk,d,q);
input d, clk;
output reg q = 1'b0;
always @(posedge clk)
   q <= d;
endmodule // D-FlipFlop

module Traffic_Controller(clk,SW,q,NS_g,NS_y,NS_r,EW_g,EW_y,EW_r); // Declare a module traffic_controller.
    input clk,SW; // Declare clk, sw as input.
    output [3:0] q; // Declare vector q as output
    output NS_g,NS_y,NS_r,EW_g,EW_y,EW_r; // Declare NS_g,NS_y,NS_r,EW_g,EW_y,EW_r as output
    reg [3:0] q = 4'b1101; // The initial value of the vector q is set to 4 bits 1101.
    reg NS_g = 1'bx;
    reg NS_y = 1'bx;
    reg NS_r = 1'bx;
    reg EW_g = 1'bx;
    reg EW_y = 1'bx;
    reg EW_r = 1'bx; // Each outputs are set to 1 bit x.
    reg y = 1'b0;
    wire qa;
    wire qb;

    
   DFF Da(clk,(qa&~y)|(qa&~qb)|(~qa&qb&y),qa);
   DFF Db(clk,(qb&~y)|(~qb&y),qb);
    always@(posedge clk or (SW==1&&(q==4'b1101))) 
// this module will be work When clk is on the rising edge or SW==1&&q==4'b1101
    begin
        if(SW==1&&(q==4'b1101)) // When q is 1101
                q = 4'b0000; // Reset the counter  
        else begin // SW == 0
            if(q < 4'b1101) // when q is less then 1101
                q = q + 1'b1; // q + 1;
            else begin 
                q = q; // if q == 1101 , fix the q
            end
           y = (~q[3]&q[2]&q[0])|(q[3]&q[2]&~q[0]|q[3]&q[1]&~q[0]);
        end

   if(qa==0&&qb==0) begin
      NS_g = 1'b1;
      NS_y = 1'b0;
      NS_r = 1'b0;
      EW_g = 1'b0;
      EW_y = 1'b0;
      EW_r = 1'b1;
       end // When the counter(q)'s output is 1101 or less than 4'b0110 -> NS green light on, EW Red light on
   else if(qa==0&&qb==1) begin
      NS_g = 1'b0;
      NS_y = 1'b1;
      NS_r = 1'b0;
      EW_g = 1'b0;
      EW_y = 1'b0;
      EW_r = 1'b1;
       end// When the counter(q)'s output is 0110, 0111 -> NS yellow light on, EW Red light on
   else if (qa==1&&qb==0) begin
      NS_g = 1'b0;
      NS_y = 1'b0;
      NS_r = 1'b1;
      EW_g = 1'b1;
      EW_y = 1'b0;
      EW_r = 1'b0;
       end// When the counter(q)'s output is 1000,1001,1010 -> NS red light on, EW green light on
   else if(qa==1&&qb==1) begin
      NS_g = 1'b0;
      NS_y = 1'b0;
      NS_r = 1'b1;
      EW_g = 1'b0;
      EW_y = 1'b1;
      EW_r = 1'b0;
       end// When the counter(q)'s output is 1011,1100 -> NS red light on, EW yellow light on
    end
    
 
endmodule
