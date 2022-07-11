// uvm_sequence 是带有参数的基类 指定类型；
class my_sequence extends uvm_sequence # (my_transaction);
  `uvm_object_utils(my_sequence);

  function new(string name = "my_sequence");
    super.new(name);
  endfunction

  virtual task body();
    if (starting_phase != null)
      starting_phase.raise_objection(this);

    repeat(10) begin
      // uvm 内建宏，用来产生 transaction； 每调用一次，产生一个 transaction；
      `uvm_do(req)
    end

    #100
    if(starting_phase != null)
      starting_phase.drop_objection(this);
  endtask
endclass
