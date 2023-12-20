require_relative 'cipher_manager'

class KeyshiftManager < CipherManager

    # Prepares the cipher for the next iteration
    def self.next(my_cipher)
        my_cipher.decryption = ""
        my_cipher.alpha = ""
        my_cipher.shift += 1
    end

    def self.reset(my_cipher)       # Overwrites parent method
        super(my_cipher)
        my_cipher.alpha = ""
        my_cipher.shift = 0
    end

    def self.build_alpha(my_cipher)    # Creates the cipher's alphabet
        my_cipher.keyword.split("").each do |char|
            next if char == " "
            my_cipher.alpha << char unless my_cipher.alpha.include? char
        end
        Keyshift.lang.split("").each { |letter| my_cipher.alpha << letter unless my_cipher.alpha.include? letter }
        my_cipher.alpha = "#{my_cipher.alpha[my_cipher.shift...my_cipher.alpha.length]}#{my_cipher.alpha[0...my_cipher.shift]}"
    end

    def self.build_key(my_cipher)       # Populates the key hash using the cipher's alphabet
        self.build_alpha(my_cipher)
        for num in 0...Keyshift.lang.length
            my_cipher.key[my_cipher.alpha[num]] = Keyshift.lang[num]
        end
    end

    def self.solve(my_cipher)       # Decrypts the cipher using it's encryption and key
        self.build_key(my_cipher)
        my_cipher.encryption.split("").each do |char|
            unless char == " "
                my_cipher.decryption << my_cipher.key[char]
            else
                my_cipher.decryption << " "
            end
        end
    end
end
