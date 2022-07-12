  1. 编译仿真命令
    ```bash
    // 在编译命令处加入
    +define+UVM_NO_DPI uvm-1.1d/src/uvm_pkg.sv test.sv
    ```
  2. 执行
    ```bash
    // 在执行命令处加入
    +UVM_TESTNAME=my_test
    ```
  3. 查看结果， 运行完会生成log文件

