// 1. 从sequencer获取transaction
// 2. 分解 transaction 为 DUT可以接受的 PIN级信号
// 3. 发送 DUT可以接受的 PIN级信号到 DUT （按总线协议）

class my_driver extends uvm_driver # (my_transaction);
  // 结构化组件用 component注册，其他用 object注册
  `uvm_component_utils(my_driver)

  function new(string name = "my_driver", uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual task run_phase (uvm_phase phase)
    forever begin
      seq_item_port.get_next_item(req);
      `uvm_info("DRV_RUN_PHASE", req.sprint(), UVM_MEDIUM)
      #100;
      seq_item_port.item_done();
    end
  endtask
endclass
