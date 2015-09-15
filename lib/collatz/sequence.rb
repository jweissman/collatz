module Collatz
  class Sequence
    extend TailCallOptimization

    def compute_next_step(n)
      return n / 2 if n % 2 == 0
      (3 * n) + 1
    end

    def compute(starting_value)
      unless starting_value.is_a?(Integer) && starting_value > 0
        raise "only defined for positive integers" 
      end
      
      return [1] if starting_value == 1
      next_value = compute_next_step starting_value
      [starting_value] + compute(next_value)
    end

    # tail call optimize 
    xtail(:compute)
  end
end
