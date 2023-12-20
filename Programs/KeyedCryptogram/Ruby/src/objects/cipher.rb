class Cipher

    attr_accessor :encryption, :keyword, :decryption

    def initialize
        @encryption = ""
        @decryption = ""
        @keyword = ""
    end

    def self.lang
        "abcdefghijklmnopqrstuvwxyz"
    end
end
