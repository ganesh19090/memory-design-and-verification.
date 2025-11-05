class mem_agent;
mem_gen  gen;
mem_bfm  bfm;
mem_monitor  mon;
mem_coverage cov;

task run();
//$display("agent functionality will be done");
gen=new();
bfm=new();
mon=new();
cov=new();

fork
gen.run();
bfm.run();
mon.run();
cov.run();
join

endtask

endclass

