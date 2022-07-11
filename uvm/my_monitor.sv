// 监视接口信号， 打包数据
// 发送给分析组件

// 使用TLM-port

class my_monitor extends uvm_monitor;
  `uvm_component_utils(my_monitor)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual task task_run_phase(uvm_phase phase);
    forever begin
      `uvm_info("MON_RUN_PHASE", "Monitor run", UVM_MEDIUM)
    #100;
    end
  endtask
endclass
