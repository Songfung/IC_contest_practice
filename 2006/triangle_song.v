module triangle (clk, reset, nt, xi, yi, busy, po, xo, yo);
  input clk, reset, nt;
  input [2:0] xi, yi;
  output busy, po;
  output [2:0] xo, yo;
  

reg [2:0] x1, x2, x3, y1, y2, y3;
reg busy,po;
reg [2:0] xo, yo;
reg [1:0] in_cnt;
reg [2:0] x_cnt,y_cnt;


wire signed [5:0] minus;
assign minus = ( ( y3 - y_cnt )*(x2 - x3) - (y3 -y2 )*(x_cnt - x3));
wire check;
assign check = minus >= 0;


always@(posedge clk or posedge reset)
begin
  if(reset)
    busy <= 0;
  else if(in_cnt == 2'b01)
    busy <= 1;
  else if(x_cnt == 3'b111 && y_cnt == 3'b111)
    busy <= 0;
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    in_cnt <= 0;
  else if(nt)
    in_cnt <= 1;
  else
    in_cnt <= in_cnt == 2'b11 ? in_cnt : in_cnt + 1;
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    x_cnt <= 0;
  else if(busy)
    x_cnt <= x_cnt == 3'b111 ? 0 : x_cnt + 1;
  
    
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    y_cnt <= 0;
  else if(busy)
    if(x_cnt === 3'b111)
      y_cnt <= y_cnt == 3'b111 ? 0 : y_cnt + 1;
  
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    x1 <= 0;
  else if(nt)
    x1 <= xi;
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    x2 <= 0;
  else if(in_cnt == 2'b01)
    x2 <= xi;
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    x3 <= 0;
  else if(in_cnt == 2'b10)
    x3 <= xi;
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    y1 <= 0;
  else if(nt)
    y1 <= yi;
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    y2 <= 0;
  else if(in_cnt == 2'b01)
    y2 <= yi;
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    y3 <= 0;
  else if(in_cnt == 2'b10)
    y3 <= yi;
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    xo <= 0;
  else if(busy)
    if(check  && x_cnt >= x1 && x_cnt <= x2)
      xo <= x_cnt;
    else
      xo <= 0;
  else
      xo <= 0;
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    yo <= 0;
  else if(busy)
    if(check && y_cnt >= y1 && y_cnt <= y3)
      yo <= y_cnt;
    else
      yo <= 0;
  else
      yo <= 0;
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    po <= 0;
  else if(busy)
    if(check  && x_cnt >= x1 && x_cnt <= x2 && y_cnt >= y1 && y_cnt <= y3)
      po <= 1;
    else
      po <= 0;
  else  
    po <= 0;
end


endmodule
