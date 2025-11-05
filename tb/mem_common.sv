`define WIDTH 8     //no of bits in memory location
`define DEPTH 32    //no of memory location 
`define ADDR_WIDTH $clog2(`DEPTH)  //size=width*depth in bits
class mem_common;
static string test_name="NWR_NRD";
static int N=15;
static mailbox gen2bfm=new();   //declare mailbox
static mailbox mon2sbd=new();
static mailbox mon2cov=new();
static int gen_count;
static int bfm_count;
static int matchings;
static int mismatchings;
endclass


//vsim -novpt -suppress 12110 tb +test_name=NWR_NRD +N=32
