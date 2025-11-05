class mem_monitor;
virtual mem_intrf vif;
mem_tx tx;
task run();
//$display("monitor functionality will be done");
vif=tb.pif;

forever begin
@(vif.mon_cb);
if(vif.mon_cb.valid==1 && vif.mon_cb.ready==1) begin
tx=new();
tx.wr_rd=vif.mon_cb.wr_rd;
tx.addr=vif.mon_cb.addr;
if(vif.mon_cb.wr_rd==1) begin
tx.wdata=vif.mon_cb.wdata;
tx.rdata=0;
end
else begin
tx.wdata=0;
@(vif.mon_cb);
tx.rdata=vif.mon_cb.rdata;
end

mem_common::mon2cov.put(tx);	
//mem_common::mon2sbd.put(tx);

tx.print("mem_mon");
end
end
endtask 

endclass



//-------------------intrf to mon------------------
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
