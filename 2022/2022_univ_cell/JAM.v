module JAM (
input CLK,
input RST,
output reg [2:0] W,
output reg [2:0] J,
input [6:0] Cost,
output reg [3:0] MatchCount,
output reg [9:0] MinCost,
output reg Valid );


reg [9:0] Sum;
reg [2:0] arr[0:7];
reg [2:0] S;//for delay W

parameter IDLE = 3'd0 ;
parameter ARR  = 3'd1 ;
parameter CAL  = 3'd2 ;
parameter OUT  = 3'd3 ;

integer i;


//machine variable
reg [2:0] next_state, state ;

parameter A_IDLE    = 3'd0 ;
parameter A_FINDRP  = 3'd1 ;//Find Replacement Point
parameter A_FINDSP  = 3'd2 ;//Find Point to Switch
parameter A_SWITCH  = 3'd3;
parameter A_REVERSE = 3'd4;
parameter A_END     = 3'd5;

reg [2:0] A_state, A_next_state;

reg [2:0] idx;
reg [2:0] sb_idx; //the smallest num bigger than arr[idx]
reg [2:0] sb_idx_buf;



//state transfer
always @(posedge CLK or posedge RST) begin
    if (RST) begin
        state   <= IDLE ;
        A_state <= A_IDLE ;
    end
    else begin
        state  <= next_state ;
        A_state  <= A_next_state ;
    end
end

always @(*) begin
        //next_state = state ;
        case(state)
            IDLE://0
                next_state=ARR;
                
            ARR://1
            begin
                if(A_state == A_END)
                    next_state = CAL;
                else next_state = ARR;
            end   
            CAL://2
            begin    
                if(W!=7)begin//keep ask the people's cost
                    next_state=CAL;
                end
                else if(W==7)begin
                    next_state=OUT;//if arr=[7 6 5 4 3 2 1 0] finish CAL, output the Valid & mostcost & count
                end
                else begin //W==7, finish finding the people && still not do 8! times
                    next_state=ARR;
                end
            end    
            OUT://3
                if(Valid)
                    next_state=IDLE;
                else
                    next_state=ARR;
                
            default:    next_state = IDLE ;
        endcase
end

//(2) state transfer for ARR 

always @(*) begin
        //next_state = state ;
    if(state == ARR)begin
        case(A_state)
            A_IDLE://0
                A_next_state=A_FINDRP;    
                
            A_FINDRP://1
            begin
                if(arr[idx] < arr[idx+1])
                    A_next_state = A_FINDSP;
                else
                    A_next_state = A_FINDRP;
            end
            A_FINDSP://2
            begin
                if(sb_idx == 7)
                    A_next_state = A_SWITCH;
            end    

            A_SWITCH://3
            begin
                A_next_state = A_REVERSE;
            end

            A_REVERSE://4
            begin
                A_next_state = A_END;
            end

            A_END://5
                A_next_state = A_IDLE;

            default: 
                A_next_state = A_IDLE ;
        endcase
    end

end


//MAIN_INIT
always @(posedge CLK or posedge RST) begin
    if(RST)begin //state == IDLE
        Valid<=0;
        Sum<=10'b0;
        // arr[0]<=0;
        // arr[1]<=1;
        // arr[2]<=2;
        // arr[3]<=3;
        // arr[4]<=4;
        // arr[5]<=5;
        // arr[6]<=6;
        // arr[7]<=7;
    end
end




//ARRANGEMENT
always @(posedge CLK or posedge RST) begin
    if(RST)
        idx <= 3'd6;
    
    else if(A_state == A_IDLE)begin//0 //A_state == A_IDLE
    //A_INIT 0
        idx <= 3'd6;
    end
    //A_FINDRP 1
    else if(A_next_state == A_FINDRP && A_state == A_FINDRP)begin//1
        idx <= idx - 1;
    end   
end

always @(posedge CLK or posedge RST) begin
        if(RST)
        sb_idx <= 3'd0;
    
    else if(A_state == A_IDLE)begin//0
        sb_idx <= 3'd0;
    end
    //A_FINDRP 1
    else if(A_state == A_FINDRP)begin//1
        sb_idx <= idx + 1;
    end   
    //A_FINDSP 2
    else if(A_next_state==A_FINDSP && sb_idx < 3'd7)begin//find the min at right to switch
            sb_idx <= sb_idx + 1;

    end
end


always @(posedge CLK or posedge RST) begin
        if(RST)
        sb_idx_buf <= 3'd0;
    
    else if(A_state == A_IDLE)begin//0
        sb_idx_buf <= 3'd0; 
    end
    else if(A_state==A_FINDRP)begin //!       
            sb_idx_buf <= idx + 1;
    end
    //A_FINDSP 2
    else if(A_state==A_FINDSP)begin
        if(arr[idx] < arr[sb_idx] && arr[sb_idx_buf] > arr[sb_idx])begin
            sb_idx_buf <= sb_idx;
        end
    end
end

always @(posedge CLK or posedge RST) begin
    if(RST)begin //state == IDLE

        arr[0]<=0;
        arr[1]<=1;
        arr[2]<=2;
        arr[3]<=3;
        arr[4]<=4;
        arr[5]<=5;
        arr[6]<=6;
        arr[7]<=7;
    end
    
    else if(A_state==A_SWITCH)begin//find the min at right to switch
        arr[idx] <= arr[sb_idx_buf];
        arr[sb_idx_buf] <= arr[idx];
        //Sum<=0;
    end
    //A_REVERSE 4
    else if(A_state==A_REVERSE)begin
        for(i = 7; i >=idx+1; i=i-1)begin
            arr[i] <= arr[8+idx-i];
        end
        // for(i = idx+1; i<=7; i=i+1)begin
        //     arr[i] <= arr[8+idx-i];
        // end
    end
end





//CAL
//W
always @(posedge CLK or posedge RST) begin//for delay W
    if(RST)
        S<= 0;
    else if(state == IDLE)begin
        S<=0;
    end
    else if(state==CAL)begin
        if(S==7)
            S<=0;
        else
            S <= S+1;
    end
    else if(state==OUT)
        S<=0;
    else if(state==ARR)
        S<=0;
end
always @(posedge CLK or posedge RST) begin
    if(RST)
        W<= 0;
    else
    W<=S;
end

//J
always @(posedge CLK or posedge RST) begin
    if(RST)
        J<= 0;
    else if(state == IDLE)begin
        J<=0;
    end
    else if(state==CAL)begin
        J <= arr[S];
    end
end

//Sum
integer c;//for delay Sum
always @(posedge CLK or posedge RST) begin
    if(RST)
        Sum<= 0;
    else if(A_state==A_SWITCH)begin//in ARR's process final part, sum ground zero
        Sum<=0;
    end
    else if(state==CAL && c!=0)begin
        Sum <=Cost+Sum;
    end
end
always @(posedge CLK or posedge RST) begin//for delay Sum
    if(RST)
        c<= 0;
    else if(A_state==A_SWITCH)begin
        c <= 0;
    end
    else if(state==CAL)begin
        c <= c+1;
    end
end

//MinCost&MatchCount
always @(posedge CLK or posedge RST) begin
    if(RST)begin
        MatchCount<=0;
        MinCost<=10'd1023;
    end
    else if(state == IDLE)begin
        MatchCount<=0;
        MinCost<=10'd1023;
    end
    else if(state==OUT)begin//(state==CAL)begin  
        //if(W==7)begin
            if(Sum<MinCost)begin
            MinCost<=Sum;
            MatchCount<=1;
            end
            else if(Sum==MinCost)begin
            MatchCount<=MatchCount+1;
            end
            else begin
            MatchCount<=MatchCount;
            end
        //end
    end
end

//output
always @(posedge CLK or posedge RST) begin
    if(RST)begin
        Valid <= 0;
    end
    else if(state == OUT)begin
        if(arr[0]==7 && arr[1]==6 && arr[2]==5 && arr[3]==4 && arr[4]==3 && arr[5]==2 && arr[6]==1 && arr[7]==0)
            Valid<=1;
        else
            Valid<=0;

    end
end

endmodule


/*always @(posedge CLK or posedge RST) begin
    //A_INIT 0
    if(A_state == A_IDLE)begin//0
        idx <= 3'd6;
        sb_idx <= 3'd0;
        sb_idx_buf <= 3'd0;
    end
    //A_FINDRP 1
    else if(A_state == A_FINDRP)begin//1
        idx <= idx - 1;
        sb_idx <= idx;
    end   
    //A_FINDSP 2
    else if(A_state==A_FINDSP)begin
//find the min at right to switch
        if(arr[idx]<arr[sb_idx] && arr[sb_idx_buf]>arr[sb_idx])begin
            sb_idx_buf <= sb_idx;
        end
        else
            sb_idx <= sb_idx + 1;
    end
    //A_SWITCH 3
    else if(A_state==A_SWITCH)begin//find the min at right to switch
        arr[idx] <= arr[sb_idx_buf];
        arr[sb_idx_buf] <= arr[idx];
        //Sum<=0;
    end
    //A_REVERSE 4
    else if(A_state==A_REVERSE)begin
        for(i = idx+1; i<=7; i=i+1)begin
            arr[i] <= arr[8+idx-i];
        end
    end
end*/