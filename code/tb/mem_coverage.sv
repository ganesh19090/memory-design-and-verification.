class mem_coverage;

mem_tx tx;

covergroup cg;
option.per_instance=1;   			//create instance
option.name="MEM_COVERAGE";			//options in coverage(name)
option.comment="memory_covergroup";	//options in coverage(comment)
WR_RD:coverpoint tx.wr_rd{
option.weight=3;					//options in coverage(weights)
bins WRITES={1'b1};
bins READS={1'b0};
option.comment="memory wr_rd coverpoint";
}

ADDRESS:coverpoint tx.addr{
//bins ADDR0={5'b00000};
//bins ADDR1={5'b00001};
//bins ADDR2={5'b00010};
//bins ADDR3={5'b00011};
//bins ADDR4={5'b00100};
//bins ADDR5={5'b00101};
//bins ADDR6={5'b00110};
//bins ADDR7={5'b00111};
//bins ADDR8={5'b01000};
//bins ADDR9={5'b01001};
//bins ADDR10={5'b01010};
//bins ADDR11={5'b01011};
//bins ADDR12={5'b01100};
//bins ADDR13={5'b01101};
//bins ADDR14={5'b01110};
//bins ADDR15={5'b01111};
//bins ADDR16={5'b10000};  //1
//bins ADDR17={5'b10001};
//bins ADDR18={5'b10010};
//bins ADDR19={5'b10011};
//bins ADDR20={5'b10100};
//bins ADDR21={5'b10101};
//bins ADDR22={5'b10110};
//bins ADDR23={5'b10111};
//bins ADDR24={5'b11000};
//bins ADDR25={5'b11001};
//bins ADDR26={5'b11010};
//bins ADDR27={5'b11011};
//bins ADDR28={5'b11100};
//bins ADDR29={5'b11101};
//bins ADDR30={5'b11110};
//bins ADDR31={5'b11111};
bins ADDR0={[0:3]};
bins ADDR1={[4:7]};
bins ADDR2={[8:11]};
bins ADDR3={[12:15]};
bins ADDR4={[16:19]};
bins ADDR5={[20:23]};
bins ADDR6={[24:27]};
bins ADDR7={[28:31]};
option.comment="memory address coverpoint";
option.weight=2;		
option.goal=70;						//options in coverage(goal)			
}
CROSS_COV:cross WR_RD,ADDRESS {
bins S=binsof(WR_RD.WRITES);
bins K=binsof(ADDRESS.ADDR4);
bins L=binsof(ADDRESS) intersect{[1:28]};
option.comment="memory cross coverpoint of wr_rd and address";
option.weight=1;
}
endgroup

function new();
cg=new();
endfunction

task run();
//mem_tx tx;
forever begin
mem_common::mon2cov.get(tx);
//tx.print("mem_cov");
cg.sample();
end
endtask

endclass

//# KERNEL: 15------mem_5WR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=20
//# KERNEL: wdata=22
//# KERNEL: rdata=0
//# KERNEL: 15------mem_5WR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=22
//# KERNEL: wdata=20
//# KERNEL: rdata=0
//# KERNEL: 15------mem_5WR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=17
//# KERNEL: wdata=29
//# KERNEL: rdata=0
//# KERNEL: 15------mem_5WR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=5
//# KERNEL: wdata=218
//# KERNEL: rdata=0
//# KERNEL: 15------mem_5WR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=1
//# KERNEL: wdata=81
//# KERNEL: rdata=0
//# KERNEL: 15------mem_5RD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=20
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 15------mem_5RD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=22
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 15------mem_5RD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=17
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 15------mem_5RD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=5
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 15------mem_5RD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=1
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 35------mem_mon--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=20
//# KERNEL: wdata=22
//# KERNEL: rdata=0
//# KERNEL: 35------mem_5WR_5RD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=20
//# KERNEL: wdata=22
//# KERNEL: rdata=0
//# KERNEL: 35------mem_cov--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=20
//# KERNEL: wdata=22
//# KERNEL: rdata=0
//# KERNEL: 65------mem_mon--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=22
//# KERNEL: wdata=20
//# KERNEL: rdata=0
//# KERNEL: 65------mem_5WR_5RD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=22
//# KERNEL: wdata=20
//# KERNEL: rdata=0
//# KERNEL: 65------mem_cov--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=22
//# KERNEL: wdata=20
//# KERNEL: rdata=0
//# KERNEL: 95------mem_mon--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=17
//# KERNEL: wdata=29
//# KERNEL: rdata=0
//# KERNEL: 95------mem_5WR_5RD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=17
//# KERNEL: wdata=29
//# KERNEL: rdata=0
//# KERNEL: 95------mem_cov--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=17
//# KERNEL: wdata=29
//# KERNEL: rdata=0
//# KERNEL: 125------mem_mon--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=5
//# KERNEL: wdata=218
//# KERNEL: rdata=0
//# KERNEL: 125------mem_5WR_5RD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=5
//# KERNEL: wdata=218
//# KERNEL: rdata=0
//# KERNEL: 125------mem_cov--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=5
//# KERNEL: wdata=218
//# KERNEL: rdata=0
//# KERNEL: 155------mem_mon--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=1
//# KERNEL: wdata=81
//# KERNEL: rdata=0
//# KERNEL: 155------mem_5WR_5RD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=1
//# KERNEL: wdata=81
//# KERNEL: rdata=0
//# KERNEL: 155------mem_cov--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=1
//# KERNEL: wdata=81
//# KERNEL: rdata=0
//# KERNEL: 195------mem_mon--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=20
//# KERNEL: wdata=0
//# KERNEL: rdata=22
//# KERNEL: 195------mem_5WR_5RD_bfm--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=20
//# KERNEL: wdata=0
//# KERNEL: rdata=22
//# KERNEL: 195------mem_cov--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=20
//# KERNEL: wdata=0
//# KERNEL: rdata=22
//# KERNEL: 235------mem_mon--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=22
//# KERNEL: wdata=0
//# KERNEL: rdata=20
//# KERNEL: 235------mem_5WR_5RD_bfm--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=22
//# KERNEL: wdata=0
//# KERNEL: rdata=20
//# KERNEL: 235------mem_cov--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=22
//# KERNEL: wdata=0
//# KERNEL: rdata=20
//# KERNEL: 275------mem_mon--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=17
//# KERNEL: wdata=0
//# KERNEL: rdata=29
//# KERNEL: 275------mem_5WR_5RD_bfm--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=17
//# KERNEL: wdata=0
//# KERNEL: rdata=29
//# KERNEL: 275------mem_cov--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=17
//# KERNEL: wdata=0
//# KERNEL: rdata=29
//# KERNEL: 315------mem_mon--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=5
//# KERNEL: wdata=0
//# KERNEL: rdata=218
//# KERNEL: 315------mem_5WR_5RD_bfm--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=5
//# KERNEL: wdata=0
//# KERNEL: rdata=218
//# KERNEL: 315------mem_cov--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=5
//# KERNEL: wdata=0
//# KERNEL: rdata=218
//# KERNEL: 355------mem_mon--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=1
//# KERNEL: wdata=0
//# KERNEL: rdata=81
//# KERNEL: 355------mem_5WR_5RD_bfm--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=1
//# KERNEL: wdata=0
//# KERNEL: rdata=81
//# KERNEL: 355------mem_cov--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=1
//# KERNEL: wdata=0
//# KERNEL: rdata=81
