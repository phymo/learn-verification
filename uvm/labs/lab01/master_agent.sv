// 可以有多个agent
// 包含 sequencer driver monitor
// passive agent and active agent

// UVM的 factory 机制 创建对象

class master_agent extends uvm_agent;
  `uvm_component_utils(master_agent)

  my_sequencer m_seqr;
  my_driver m_driv;
  my_monitor m_moni;

  function new(string name = "", uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // 只有active master agent才能创建sequencer和driver
    if(is_active == UVM_ACTIVE) begin
      m_seqr = my_sequencer::type_id::create("m_seqr", this);
      m_driv= my_driver::type_id::create("m_driv", this);
    end
    m_moni = my_monitor::type_id::create("m_moni", this);
  endfunction

  virtual function void connect_phase(uvm_phase phaase);
    if(is_active == UVM_ACTIVE)
      m_driv.seq_item_port.connect(m_seqr.seq_item_export);
  endfunction
endclass
