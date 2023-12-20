Dir[File.join(__dir__, '../objects/*.rb')].each { |file| require file }

class CipherManager

    def self.validate_inputs(my_cipher)     # Makes sure all inputs are lowercase
        my_cipher.encryption.downcase!
        my_cipher.keyword.downcase!
    end

    def self.reset(my_cipher)       # Resets the cipher's decryption, keyword, and shift values
        my_cipher.decryption = ""
        my_cipher.keyword = ""
    end

    def self.lowercase(my_cipher)        # Downcases all off the cipher's string inputs
        my_cipher.encryption.downcase!
        my_cipher.keyword.downcase!
    end

    def self.display(list_index, my_cipher)     # Used for displaying a cipher in a menu
        puts "  #{list_index} | #{my_cipher.name} | #{my_cipher.encryption.upcase} <=> #{my_cipher.decryption.upcase}"
    end
end
