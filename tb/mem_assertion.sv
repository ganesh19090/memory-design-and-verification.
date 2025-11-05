module mem_assertion(clk,rst,wr_rd,addr,wdata,rdata,valid,ready);
input clk,rst,wr_rd,valid,ready;
input [`ADDR_WIDTH-1:0]addr;
input [`WIDTH-1:0]wdata,rdata;

property reset;
@(posedge clk)(rst==1) |-> ##0 (wr_rd==0 && valid==0 && ready==0 && addr==0 && wdata==0 && rdata==0);
endproperty
RESET:assert property(reset);
  
//   assert property (reset)
//     $display("ASSERTION PASSED: Reset cleared all signals at %0t", $time);
//   else
//     $error("ASSERTION FAILED: Signals not zero during reset at %0t", $time);
//---------------------------------------------------------------------------------------------
property preset;
@(posedge clk)(rst==0) |-> ##0 ((!($isunknown(wr_rd))) && (!($isunknown(addr))) && (!($isunknown(wdata))) && (!($isunknown(rdata))) && (!($isunknown(ready))) && (!($isunknown(valid))));
endproperty
PRESET:assert property(preset);
  
//   assert property (preset)
//     $display("ASSERTION PASSED: pReset cleared all signals at %0t", $time);
//   else
//     $error("ASSERTION FAILED: Signals not zero during reset at %0t", $time);
//---------------------------------------------------------------------------------------------
property handshaking;
  @(posedge clk) (valid==1) |-> ##1 (ready==1);
endproperty
HANDSHAKING:assert property (handshaking);
  
//    assert property (handshaking)
//     $display("ASSERTION PASSED: valid→ready handshake succeeded at %0t", $time);
//   else
//     $error("ASSERTION FAILED: ready not high 1 cycle after valid @%0t", $time);

//---------------------------------------------------------------------------------------------
property writes;
@(posedge clk) (wr_rd==1) |-> ((!($isunknown(addr))) && (!($isunknown(wdata))));
endproperty
WRITES:assert property(writes);
  
   assert property (writes)
     $display("ASSERTION PASSED: Valid write (addr=%0d, wdata=%0d) at %0t", addr, wdata, $time);
  else
    $error("ASSERTION FAILED: Write occurred with unknown addr/wdata at %0t", $time);

//---------------------------------------------------------------------------------------------
property reads;
@(posedge clk) (wr_rd==0) |-> ((!($isunknown(addr))) && (!($isunknown(rdata))));
endproperty
READS:assert property(reads);
  
//   assert property (reads)
//     $display("ASSERTION PASSED: Valid read (addr=%0d, rdata=%0d) at %0t", addr, rdata, $time);
//   else
//     $error("ASSERTION FAILED: Read occurred with unknown addr/rdata at %0t", $time);

//---------------------------------------------------------------------------------------------
property hand;
@(posedge clk) (valid==0) |-> ##1 (ready==0);
endproperty 
HAND:assert property(hand);
endmodule

//output of assertion in transcript

//# KERNEL: ASSERTION PASSED: Valid write (addr=0, wdata=0) at 5
//# KERNEL: 15------mem_NWR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=31
//# KERNEL: wdata=226
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NWR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=0
//# KERNEL: wdata=195
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NWR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=9
//# KERNEL: wdata=180
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NWR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=4
//# KERNEL: wdata=98
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NWR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=18
//# KERNEL: wdata=197
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NWR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=28
//# KERNEL: wdata=15
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NWR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=30
//# KERNEL: wdata=14
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NWR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=25
//# KERNEL: wdata=61
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NWR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=3
//# KERNEL: wdata=204
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NWR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=15
//# KERNEL: wdata=187
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NWR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=1
//# KERNEL: wdata=149
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NWR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=14
//# KERNEL: wdata=21
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NWR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=17
//# KERNEL: wdata=228
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NWR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=26
//# KERNEL: wdata=22
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NWR_gen--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=2
//# KERNEL: wdata=246
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NRD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=31
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NRD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=0
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NRD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=9
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NRD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=4
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NRD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=18
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NRD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=28
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NRD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=30
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NRD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=25
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NRD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=3
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NRD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=15
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NRD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=1
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NRD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=14
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NRD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=17
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NRD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=26
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: 15------mem_NRD_gen--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=2
//# KERNEL: wdata=0
//# KERNEL: rdata=0
//# KERNEL: ASSERTION PASSED: Valid write (addr=31, wdata=226) at 25
//# KERNEL: 35------mem_mon--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=31
//# KERNEL: wdata=226
//# KERNEL: rdata=0
//# KERNEL: 35------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=31
//# KERNEL: wdata=226
//# KERNEL: rdata=0
//# KERNEL: ASSERTION PASSED: Valid write (addr=0, wdata=0) at 45
//# KERNEL: ASSERTION PASSED: Valid write (addr=0, wdata=195) at 55
//# KERNEL: 65------mem_mon--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=0
//# KERNEL: wdata=195
//# KERNEL: rdata=0
//# KERNEL: 65------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=0
//# KERNEL: wdata=195
//# KERNEL: rdata=0
//# KERNEL: ASSERTION PASSED: Valid write (addr=0, wdata=0) at 75
//# KERNEL: ASSERTION PASSED: Valid write (addr=9, wdata=180) at 85
//# KERNEL: 95------mem_mon--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=9
//# KERNEL: wdata=180
//# KERNEL: rdata=0
//# KERNEL: 95------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=9
//# KERNEL: wdata=180
//# KERNEL: rdata=0
//# KERNEL: ASSERTION PASSED: Valid write (addr=0, wdata=0) at 105
//# KERNEL: ASSERTION PASSED: Valid write (addr=4, wdata=98) at 115
//# KERNEL: 125------mem_mon--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=4
//# KERNEL: wdata=98
//# KERNEL: rdata=0
//# KERNEL: 125------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=4
//# KERNEL: wdata=98
//# KERNEL: rdata=0
//# KERNEL: ASSERTION PASSED: Valid write (addr=0, wdata=0) at 135
//# KERNEL: ASSERTION PASSED: Valid write (addr=18, wdata=197) at 145
//# KERNEL: 155------mem_mon--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=18
//# KERNEL: wdata=197
//# KERNEL: rdata=0
//# KERNEL: 155------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=18
//# KERNEL: wdata=197
//# KERNEL: rdata=0
//# KERNEL: ASSERTION PASSED: Valid write (addr=0, wdata=0) at 165
//# KERNEL: ASSERTION PASSED: Valid write (addr=28, wdata=15) at 175
//# KERNEL: 185------mem_mon--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=28
//# KERNEL: wdata=15
//# KERNEL: rdata=0
//# KERNEL: 185------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=28
//# KERNEL: wdata=15
//# KERNEL: rdata=0
//# KERNEL: ASSERTION PASSED: Valid write (addr=0, wdata=0) at 195
//# KERNEL: ASSERTION PASSED: Valid write (addr=30, wdata=14) at 205
//# KERNEL: 215------mem_mon--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=30
//# KERNEL: wdata=14
//# KERNEL: rdata=0
//# KERNEL: 215------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=30
//# KERNEL: wdata=14
//# KERNEL: rdata=0
//# KERNEL: ASSERTION PASSED: Valid write (addr=0, wdata=0) at 225
//# KERNEL: ASSERTION PASSED: Valid write (addr=25, wdata=61) at 235
//# KERNEL: 245------mem_mon--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=25
//# KERNEL: wdata=61
//# KERNEL: rdata=0
//# KERNEL: 245------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=25
//# KERNEL: wdata=61
//# KERNEL: rdata=0
//# KERNEL: ASSERTION PASSED: Valid write (addr=0, wdata=0) at 255
//# KERNEL: ASSERTION PASSED: Valid write (addr=3, wdata=204) at 265
//# KERNEL: 275------mem_mon--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=3
//# KERNEL: wdata=204
//# KERNEL: rdata=0
//# KERNEL: 275------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=3
//# KERNEL: wdata=204
//# KERNEL: rdata=0
//# KERNEL: ASSERTION PASSED: Valid write (addr=0, wdata=0) at 285
//# KERNEL: ASSERTION PASSED: Valid write (addr=15, wdata=187) at 295
//# KERNEL: 305------mem_mon--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=15
//# KERNEL: wdata=187
//# KERNEL: rdata=0
//# KERNEL: 305------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=15
//# KERNEL: wdata=187
//# KERNEL: rdata=0
//# KERNEL: ASSERTION PASSED: Valid write (addr=0, wdata=0) at 315
//# KERNEL: ASSERTION PASSED: Valid write (addr=1, wdata=149) at 325
//# KERNEL: 335------mem_mon--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=1
//# KERNEL: wdata=149
//# KERNEL: rdata=0
//# KERNEL: 335------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=1
//# KERNEL: wdata=149
//# KERNEL: rdata=0
//# KERNEL: ASSERTION PASSED: Valid write (addr=0, wdata=0) at 345
//# KERNEL: ASSERTION PASSED: Valid write (addr=14, wdata=21) at 355
//# KERNEL: 365------mem_mon--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=14
//# KERNEL: wdata=21
//# KERNEL: rdata=0
//# KERNEL: 365------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=14
//# KERNEL: wdata=21
//# KERNEL: rdata=0
//# KERNEL: ASSERTION PASSED: Valid write (addr=0, wdata=0) at 375
//# KERNEL: ASSERTION PASSED: Valid write (addr=17, wdata=228) at 385
//# KERNEL: 395------mem_mon--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=17
//# KERNEL: wdata=228
//# KERNEL: rdata=0
//# KERNEL: 395------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=17
//# KERNEL: wdata=228
//# KERNEL: rdata=0
//# KERNEL: ASSERTION PASSED: Valid write (addr=0, wdata=0) at 405
//# KERNEL: ASSERTION PASSED: Valid write (addr=26, wdata=22) at 415
//# KERNEL: 425------mem_mon--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=26
//# KERNEL: wdata=22
//# KERNEL: rdata=0
//# KERNEL: 425------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=26
//# KERNEL: wdata=22
//# KERNEL: rdata=0
//# KERNEL: ASSERTION PASSED: Valid write (addr=0, wdata=0) at 435
//# KERNEL: ASSERTION PASSED: Valid write (addr=2, wdata=246) at 445
//# KERNEL: 455------mem_mon--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=2
//# KERNEL: wdata=246
//# KERNEL: rdata=0
//# KERNEL: 455------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=1
//# KERNEL: addr=2
//# KERNEL: wdata=246
//# KERNEL: rdata=0
//# KERNEL: ASSERTION PASSED: Valid write (addr=0, wdata=0) at 465
//# KERNEL: 495------mem_mon--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=31
//# KERNEL: wdata=0
//# KERNEL: rdata=226
//# KERNEL: 495------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=31
//# KERNEL: wdata=0
//# KERNEL: rdata=226
//# KERNEL: 535------mem_mon--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=0
//# KERNEL: wdata=0
//# KERNEL: rdata=195
//# KERNEL: 535------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=0
//# KERNEL: wdata=0
//# KERNEL: rdata=195
//# KERNEL: 575------mem_mon--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=9
//# KERNEL: wdata=0
//# KERNEL: rdata=180
//# KERNEL: 575------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=9
//# KERNEL: wdata=0
//# KERNEL: rdata=180
//# KERNEL: 615------mem_mon--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=4
//# KERNEL: wdata=0
//# KERNEL: rdata=98
//# KERNEL: 615------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=4
//# KERNEL: wdata=0
//# KERNEL: rdata=98
//# KERNEL: 655------mem_mon--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=18
//# KERNEL: wdata=0
//# KERNEL: rdata=197
//# KERNEL: 655------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=18
//# KERNEL: wdata=0
//# KERNEL: rdata=197
//# KERNEL: 695------mem_mon--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=28
//# KERNEL: wdata=0
//# KERNEL: rdata=15
//# KERNEL: 695------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=28
//# KERNEL: wdata=0
//# KERNEL: rdata=15
//# KERNEL: 735------mem_mon--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=30
//# KERNEL: wdata=0
//# KERNEL: rdata=14
//# KERNEL: 735------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=30
//# KERNEL: wdata=0
//# KERNEL: rdata=14
//# KERNEL: 775------mem_mon--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=25
//# KERNEL: wdata=0
//# KERNEL: rdata=61
//# KERNEL: 775------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=25
//# KERNEL: wdata=0
//# KERNEL: rdata=61
//# KERNEL: 815------mem_mon--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=3
//# KERNEL: wdata=0
//# KERNEL: rdata=204
//# KERNEL: 815------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=3
//# KERNEL: wdata=0
//# KERNEL: rdata=204
//# KERNEL: 855------mem_mon--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=15
//# KERNEL: wdata=0
//# KERNEL: rdata=187
//# KERNEL: 855------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=15
//# KERNEL: wdata=0
//# KERNEL: rdata=187
//# KERNEL: 895------mem_mon--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=1
//# KERNEL: wdata=0
//# KERNEL: rdata=149
//# KERNEL: 895------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=1
//# KERNEL: wdata=0
//# KERNEL: rdata=149
//# KERNEL: 935------mem_mon--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=14
//# KERNEL: wdata=0
//# KERNEL: rdata=21
//# KERNEL: 935------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=14
//# KERNEL: wdata=0
//# KERNEL: rdata=21
//# KERNEL: 975------mem_mon--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=17
//# KERNEL: wdata=0
//# KERNEL: rdata=228
//# KERNEL: 975------mem_NWR_NRD_bfm--------
//# KERNEL: wr_rd=0
//# KERNEL: addr=17
//# KERNEL: wdata=0
//# KERNEL: rdata=228

