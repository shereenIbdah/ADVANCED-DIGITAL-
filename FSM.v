`define green  2'b00
`define yellow  2'b01	 
`define red 2'b10
`define red_yellow 2'b11
   	//Project
 module traffic_light_controller (clk,Rst,go ,highwaySignal1,highwaySignal2,farmwaysignal1,farmwaysignal2, presentState , count ) ;// 5 bit counter	
	
	output reg [1:0] highwaySignal1,highwaySignal2,
	farmwaysignal1,farmwaysignal2;
	input clk,Rst ;
	input go;  
	output reg [4:0] count;
	output reg [4:0] presentState ; 
	reg [4:0] nextState;	   
	parameter 
	S0=0 , S1=1 , S2=2 , S3 =3 , S4=4,S5= 5 ,S6 =6 , S7=7 ,S8=8,S9=9,
	S10=10,S11=11,S12=12,S13=13,S14=14,S15=15,S16=16,S17=17 ;		   
	always @(posedge clk, posedge Rst )
		begin 
			if (Rst)
				begin //if reset equal 1 then reset
				presentState = S0;	   
				end	  
			else 
				presentState = nextState;	
			end	 
		
				
       always @(count)
		case (presentState)
		S0 :   begin  // delay by one then go to  s1	   
		if (count == 1)
			begin 	
			count=0;
		    nextState = S1 ;	 
			end	   
		else 
			begin 
	        nextState= S0;	
				end
			end
	 S1 :  begin
			 if ( count == 2 )
			begin	
			
			count=0;
			nextState = S2 ;	  
		
			end		 
			end
		S2 :  	begin
				if ( count == 30)
					begin 	
			count=0;
	         nextState = S3;	 	
			end
			end
			
		S3 : begin	
		if ( count == 2)
		begin 
			count =0; 
			 nextState = S4;  	
		end		 
		end
		S4 : begin
			if(count == 10)
				begin
			count=0;
			nextState = S5;	  
			
			end	
			end
		S5 :    begin 
			if(count == 2) 
				begin
			count=0;
			 nextState  = S6;	
			end		
			end
		
		S6 :    begin
				if (count  == 1)
				begin
				count =0;
			nextState  = S7;	

			end			 
			end
		S7 :     begin
				if ( count  ==2 )
					begin  
		    count=0;
			 nextState  = S8;	
			end 
			end
			   
		S8 :  begin 
				if ( count == 15 )
					begin	
			count=0;	 
			nextState  = S9;
			end		  	 
			end
	
		S9 :    begin 	
			if ( count== 2 ) 
					begin  
		    count=0;
			nextState = S10;
			end			  
			end
		S10:	  begin 
				if ( count == 5 ) 
					begin	  
						count =0;
			nextState = S11;
			end		   	 
			end
		S11: 	 
		         begin
		 		if ( count == 2 )
					begin		 
						count=0;
			nextState = S12;  		
			end
			end
		S12: 
		        begin
				if ( count ==10)
					begin  
						count=0;
			 nextState = S13;
			end			 
			end
		S13:	 begin
				if ( count == 2)
					begin	
						count=0;
			 nextState = S14;
			end			 
			end
		S14:	   begin   
				if ( count == 10  )
					begin	 
						count=0;
			nextState = S15; 
			end			 
			end
		S15:	 
		 begin   
				if ( count ==2 )
					begin 
						count =0;
			nextState = S16;
			end
			end
		S16:  
		       begin 
				if( count == 15 )
					begin	
			count=0;
			nextState = S17;
			end			 
	        end
	
		S17:	 
		    begin   
		if (count == 3)
			begin 		 
			count=0;
			nextState = S0;	
			end	  
		end	
            
			endcase	 
			
			always @(presentState) 		
			case (presentState)
				S0  : begin   
			highwaySignal1= `red; 
			highwaySignal2= `red; 	//the real value is red 
			farmwaysignal1= `red;
			farmwaysignal2=`red;	
			end  	
				S1 :  begin  
			highwaySignal1= `red_yellow; 
			highwaySignal2= `red_yellow; 	 
			farmwaysignal1= `red;
			farmwaysignal2=`red;	
					end 
			S2 : begin 	 
		   highwaySignal1= `green;  // the real value is green
			highwaySignal2= `green; 	 
			farmwaysignal1= `red;
			farmwaysignal2=`red;
		
			end 	   	
			S3 : begin 	  
			highwaySignal1= `green; 
			highwaySignal2= `yellow; 	 
			farmwaysignal1= `red;
			farmwaysignal2=`red;	
			end   
			S4 : begin 	
			highwaySignal1= `green; 
			highwaySignal2= `red; 	 
			farmwaysignal1= `red;
			farmwaysignal2=`red; 
			end    
			S5 : begin 	
			highwaySignal1= `yellow; 
			highwaySignal2= `red; 	 
			farmwaysignal1= `red;
			farmwaysignal2=`red; 
			end 	
			S6 : begin 		
			highwaySignal1= `red; 
			highwaySignal2= `red; 	 
			farmwaysignal1= `red;
			farmwaysignal2=`red; 
			end  		  
			S7 : begin
		   highwaySignal1= `red; 
			highwaySignal2= `red; 	 
			farmwaysignal1= `red_yellow;
			farmwaysignal2=`red_yellow;
			end  
			S8  : begin   
			highwaySignal1= `red; 
			highwaySignal2= `red; 	 
			farmwaysignal1= `green;
			farmwaysignal2=`green;	 
				
			end 		 
			S9 : begin 	 
		    highwaySignal1= `red; 
			highwaySignal2= `red; 	 
			farmwaysignal1= `green;
			farmwaysignal2=`yellow;	
			end	  
			S10 : begin  
			highwaySignal1= `red; 
			highwaySignal2= `red; 	 
			farmwaysignal1= `green;
			farmwaysignal2=`red;  
			end    
			S11 : begin	 
			highwaySignal1= `red; 
			highwaySignal2= `red; 	   
			farmwaysignal1= `yellow;
			farmwaysignal2=`red_yellow;	
			end    
			S12 : begin    
			 highwaySignal1= `red; 
			highwaySignal2= `red; 	 
			farmwaysignal1= `red;	 
			farmwaysignal2=`green;	
			end	  
			S13  : begin  
				
			highwaySignal1= `red; 
			highwaySignal2= `red; 	 
			farmwaysignal1= `red;
			farmwaysignal2=`yellow;	
				end 
				
		    S14 : begin  
			highwaySignal1= `red; 
			highwaySignal2= `red; 	 
			farmwaysignal1= `red;
			farmwaysignal2=`red; 
			end  
			S15  : begin  
				highwaySignal1= `red; 
			highwaySignal2= `red_yellow; 	 
			farmwaysignal1= `red;
			farmwaysignal2=`red; 
				
			end	 
			S16 : begin  
			highwaySignal1= `red; 
			highwaySignal2= `green; 	 
			farmwaysignal1= `red;	 
			farmwaysignal2=`red; 
			end   		 
			S17 : begin    
		   highwaySignal1= `red; 
			highwaySignal2= `yellow; 	 
			farmwaysignal1= `red;
			farmwaysignal2=`red; 
				end
			endcase
		
					
	always @(posedge clk , posedge Rst)	
		begin  
		if(Rst)   
			count =0 ;
		else if (go)  
		count= count +1;  
		 end
			endmodule
			
			
module FSMTEST; 		 // inputs 
 reg clk,Rst,go;			 
 wire [1:0] highwaySignal1,highwaySignal2,farmwaysignal1,farmwaysignal2;	
// wire count;				  
wire [4:0] presentState , count; 	
traffic_light_controller F1 (clk,Rst,go ,highwaySignal1,highwaySignal2,farmwaysignal1,farmwaysignal2 , 
presentState ,count ) ; 
Analyzer A1( clk,presentState , highwaySignal1,highwaySignal2,farmwaysignal1,farmwaysignal2 ,Rst ,count );	  
 initial begin 	 
//$monitor("at time = %d  present State = %d the HW1 = %b HW2 =%b FW1 = %b FW2= %b count = %d",$time,presentState,
//highwaySignal1,highwaySignal2,farmwaysignal1,farmwaysignal2,count); 
	 clk=0;
	 Rst=1;   																																										  
	  go=1;	
	 #50 Rst = 0;		 
	 #3495 $finish;
 end  
 always #15 clk = ~clk;  	 
 endmodule	 
 
 
 
 
module Analyzer( clk,presentState , highwaySignal1,highwaySignal2,farmwaysignal1,farmwaysignal2 , Rst ,count );  
	input [4:0] presentState , count; 
	input clk , Rst;	 
	reg [7:0] expected;	// [7:6] HW1 ,[5:4] HW2, [3:2] FW1 , [1:0] FW2	 	 
	reg [4:0] realDelay;
	reg [7:0] ROM [0:17] ='{8'hAA, 8'hFA , 8'h0A, 8'h1A , 8'h2A , 8'h6A , 
	8'hAA, 8'hAF , 8'hA0 , 8'hA1 , 8'hA2 , 8'hA7 , 8'hA8,					   // This ROM to store the valuse ot Outputs 
	8'hA9 , 8'hAA, 8'hBA  , 8'h8A, 8'h9A}; 
	assign expected = ROM[presentState ];	
	reg [4:0] ROMDELAY [0:17] = '{5'd1 ,5'd2 , 5'd30 , 5'd2 , 5'd10 , 5'd2 , 5'd1 , 5'd2 , 5'd15 , 5'd2 , 5'd5,
	5'd2 , 5'd10 , 5'd2 ,5'd1 , 5'd2 , 5'd15 , 5'd3};	// ROM store the value of the delay of each state	 
	assign realDelay = ROMDELAY[presentState ];	
  input [1:0] highwaySignal1,highwaySignal2,farmwaysignal1,farmwaysignal2;		 			   	
     always @(posedge clk , posedge Rst)
	  begin		  
		  if(Rst == 1)
			  begin 
		  if({highwaySignal1,highwaySignal2,farmwaysignal1,farmwaysignal2} != 8'hAA)	
			  begin		   
			  $display("There are an error When Reset is on, one of highwaySignal1,highwaySignal2,farmwaysignal1,farmwaysignal2 values is not red" ) ;   
			  end
			  end	  
		    else 
			  begin	  
			  if( count+1  == realDelay )	   // the last clk in the state
			  begin  	 
		  if({highwaySignal1,highwaySignal2,farmwaysignal1,farmwaysignal2} == expected)	 
			  begin
				  $display("There is no error in output of State %d" , presentState)  ;	
				  end  
		  else	
		
			  begin   	  
				  $display ("There are  errror in the State %d output " , presentState);		
				  if ( highwaySignal1 != expected[7:6] )
					  begin
					  $display("value of highwaySignal1  must be %b  but it %b ",expected[7:6],highwaySignal1)	  ;
					  end		 
				    if ( highwaySignal2 != expected[5:4] )
					  begin
					  $display("value of highwaySignal2  must be %b  but it %b ",expected[5:4],highwaySignal2)	  ;
					  end		
					 if ( farmwaysignal1 != expected[3:2] )
					  begin
					  $display("value of farmSignal2  must be %b  but it %b ",expected[3:2],farmwaysignal1)	  ;
					  end	
					   if ( farmwaysignal2 != expected[1:0] )
					  begin
					  $display("value of farmSignal2  must be %b  but it %b ",expected[1:0],farmwaysignal2)	  ;
					  end
					  end  
					 
					end 
	
		  end 	 
	
		  end	   
	
endmodule