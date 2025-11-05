class mem_env;
mem_agent agent;
mem_scoreboard sbd;
task run();
//$display("agent functionality will be done");

agent=new();
sbd=new();

fork
agent.run();
sbd.run();
join

endtask

endclass
