// test case实例化和配置 env
// 指定启动的sequence

  class my_test extends uvm_test;
    `uvm_compnent_utils(my_test)
    my_env m_env;
    function new(string name = "", uvm_component parent);
      super.new(name, parent)
    endfunction

    virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      m_env = my_env::type_id::create("m_env", this);

      uvm_config_db# (uvm_object_wrapper)::set(
        this, "*.m_seqr.run_phase", "default_sequence", my_sequence::get_type()
      );
    endfunction

    virtual function void start_of_simulation_phase(uvm_phase phase);
      super.start_of_simulation_phase(phase);
      uvm_top.print_topology(uvm_defalut_tree_printer);
    endfunction

  endclass
