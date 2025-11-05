module tb;

mem_intrf pif(clk,rst); 	//physical interface instantion
  reg clk;
  reg rst;
  memory dut (
    .clk(pif.clk),
    .rst(pif.rst),
    .addr(pif.addr),
    .wr_rd(pif.wr_rd),
    .wdata(pif.wdata),
    .rdata(pif.rdata),
    .valid(pif.valid),
    .ready(pif.ready)
  );
mem_assertion uut(
 	.clk(pif.clk),
    .rst(pif.rst),
    .wr_rd(pif.wr_rd),
    .addr(pif.addr),
    .wdata(pif.wdata),
    .rdata(pif.rdata),
    .valid(pif.valid),
    .ready(pif.ready)
  );

mem_env env;  //env class

always #5 clk=~clk;		//generate clk

initial begin
clk=0;
rst=1;
repeat(2)@(posedge clk);
rst=0;
$value$plusargs("test_name=%0s",mem_common::test_name);
$value$plusargs("N=%0d",mem_common::N);
env=new();
env.run();
end

initial begin
#50;
wait(mem_common::gen_count==mem_common::bfm_count);
#50;
if(mem_common::matchings!=0 && mem_common::mismatchings==0) begin
$display("test passed");
$display("matchings=%0d,mismaching=%0d",mem_common::matchings,mem_common::mismatchings);
end
else begin
$display("test falied");
$display("matchings=%0d,mismaching=%0d",mem_common::matchings,mem_common::mismatchings);
end
$finish;
end

initial begin
  #1000; // or enough for your BFM to run
//  $display("Simulation completed at time %0t", $time);
//  $coverage_save("cov.ucdb");
  $finish;
end

initial begin
  $dumpfile("wave.vcd");
  $dumpvars(0, tb);
end

//end
endmodule


//# KERNEL: tb functionality will be done
//# KERNEL: env functionality will be done
//# KERNEL: agent functionality will be done
//# KERNEL: generator functionality will be done
//# KERNEL: bfm functionality will be done
//# KERNEL: monitor functionality will be done
//# KERNEL: coverage functionality will be done
//# KERNEL: scoreboard functionality will be done
