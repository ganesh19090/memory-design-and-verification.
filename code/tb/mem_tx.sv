class mem_tx;
rand bit wr_rd;
randc bit [`ADDR_WIDTH-1:0]addr;
rand bit [`WIDTH-1:0]wdata;
     bit [`WIDTH-1:0]rdata;   //sent by memory to processor so no rand

function void print(input string str="mem_tx");
$display("%0t------%0s--------",$time,str);
$display("wr_rd=%0d",wr_rd);
$display("addr=%0d",addr);
$display("wdata=%0d",wdata);
$display("rdata=%0d",rdata);
endfunction

endclass
