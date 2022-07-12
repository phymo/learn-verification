// run test
// program 可以用来启动仿真平台

program automatic test;
  import uvm_pkg::*;
  `include "uvm_macro.svh"
  ...// `include 引入所有的代码文件，按照顺序

  initial begin
    run_test();
  end

endprogram;
