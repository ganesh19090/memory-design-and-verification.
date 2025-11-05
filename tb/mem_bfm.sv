class mem_bfm;
mem_tx tx;
virtual mem_intrf vif;  //virtual interface constructs
task run();
vif=tb.pif;		//pointer to physical interface and physical interface is present at tb  and i cannot access physical intfce within class
forever begin
mem_common::gen2bfm.get(tx); //mailbox declaration
drive_tx(tx);
tx.print("mem_NWR_NRD_bfm");

end
endtask

task drive_tx(input mem_tx tx);
@(vif.bfm_cb);	
vif.bfm_cb.wr_rd	<=tx.wr_rd;
vif.bfm_cb.addr		<=tx.addr;

if(tx.wr_rd==1) vif.bfm_cb.wdata<=tx.wdata;   //write operation
else vif.bfm_cb.wdata	<=0;

vif.bfm_cb.valid		<=1;		//read operation
wait(vif.bfm_cb.ready==1);
if(tx.wr_rd==0) begin
@(vif.bfm_cb);
tx.rdata=vif.bfm_cb.rdata;
end
else tx.rdata=0;

@(vif.bfm_cb);		//deasserting signals to 0
vif.bfm_cb.wr_rd		<=0;
vif.bfm_cb.wdata		<=0;
vif.bfm_cb.addr			<=0;
vif.bfm_cb.valid		<=0;

endtask
endclass

//-----------------bfm_cb------------------------
//
//# KERNEL: 15------mem_5WR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=5
//# KERNEL: wdata=208
//# KERNEL: rdata=0
//# KERNEL: 15------mem_5WR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=14
//# KERNEL: wdata=221
//# KERNEL: rdata=0
//# KERNEL: 15------mem_5WR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=23
//# KERNEL: wdata=92
//# KERNEL: rdata=0
//# KERNEL: 15------mem_5WR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=1
//# KERNEL: wdata=61
//# KERNEL: rdata=0
//# KERNEL: 15------mem_5WR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=20
//# KERNEL: wdata=49
//# KERNEL: rdata=0
//# KERNEL: 15------mem_5RD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=5
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 15------mem_5RD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=14
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 15------mem_5RD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=23
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 15------mem_5RD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=1
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 15------mem_5RD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=20
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 35------mem_5WR_5RD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=5
//# KERNEL: wdata=208
//# KERNEL: rdata=0
//# KERNEL: 65------mem_5WR_5RD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=14
//# KERNEL: wdata=221
//# KERNEL: rdata=0
//# KERNEL: 95------mem_5WR_5RD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=23
//# KERNEL: wdata=92
//# KERNEL: rdata=0
//# KERNEL: 125------mem_5WR_5RD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=1
//# KERNEL: wdata=61
//# KERNEL: rdata=0
//# KERNEL: 155------mem_5WR_5RD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=20
//# KERNEL: wdata=49
//# KERNEL: rdata=0
//# KERNEL: 195------mem_5WR_5RD_bfm--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=5
//# KERNEL: wdata=0
//# KERNEL: rdata=208
//# KERNEL: 235------mem_5WR_5RD_bfm--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=14
//# KERNEL: wdata=0
//# KERNEL: rdata=221
//# KERNEL: 275------mem_5WR_5RD_bfm--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=23
//# KERNEL: wdata=0
//# KERNEL: rdata=92
//# KERNEL: 315------mem_5WR_5RD_bfm--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=1
//# KERNEL: wdata=0
//# KERNEL: rdata=61
//# KERNEL: 355------mem_5WR_5RD_bfm--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=20
//# KERNEL: wdata=0
//# KERNEL: rdata=49
