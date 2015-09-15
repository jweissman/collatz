require 'collatz/version'

require 'prime'

module Collatz
  module Sequence
    def self.compute_next_step(n)
      return n / 2 if n % 2 == 0
      (3 * n) + 1
    end

    def self.compute(starting_value)
      raise "only defined for positive integers" unless starting_value > 0 && starting_value.is_a?(Integer)
      return [1] if starting_value == 1
      next_value = compute_next_step starting_value
      [starting_value] + compute(next_value)
    end

    def collatz(n); Collatz::Sequence.compute(n) end

    def narrate(n)
      collatz(n).each do |i|
        puts "#{i} #{i.prime? ? '*' : i.prime_division}"
      end
    end
  end
end
