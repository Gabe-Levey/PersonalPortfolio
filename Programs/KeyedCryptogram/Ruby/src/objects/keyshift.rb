require_relative 'cipher'

class Keyshift < Cipher

    attr_accessor :alpha, :key, :shift
    
    def initialize
        super
        @alpha = ""
        @key = Hash.new
        @shift = 0
    end
end
