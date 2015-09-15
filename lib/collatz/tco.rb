module TailCallOptimization
  RubyVM::InstructionSequence.compile_option = {
    tailcall_optimization: true,
    trace_instruction: false
  }

  def recompile_with_tail(meth)
    meth = %{
      class #{self.to_s}
        #{meth}
      end
    }

    RubyVM::InstructionSequence.new(meth).eval
  end

  def xtail(meth)
    m = self.instance_method(meth)
    self.send :undef_method, meth
    recompile_with_tail(m.source)
  end
end

