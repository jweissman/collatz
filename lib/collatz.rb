require 'prime'
require 'colorize'
require 'method_source'
require 'pry'
require 'graph'

require 'collatz/version'
require 'collatz/tco'
require 'collatz/sequence'
require 'collatz/graph'
require 'collatz/helpers'

module Collatz
  include Collatz::Helpers
end
