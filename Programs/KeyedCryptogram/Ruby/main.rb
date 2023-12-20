Dir[File.join(__dir__, 'src/managers/*.rb')].each { |file| require file }

my_cipher = Keyshift.new
print "Please enter the encryption: "
my_cipher.encryption = gets.chomp
system("clear") || system("cls")

menu = true
while menu
    puts "Encryption: #{my_cipher.encryption.upcase}"
    print "Keyword: "
    my_cipher.keyword = gets.chomp
    KeyshiftManager.validate_inputs(my_cipher)
    puts "Decryptions"
    until my_cipher.shift >= 26
        KeyshiftManager.solve(my_cipher)
        print "   Shift of "
        print " " if my_cipher.shift < 10
        puts "#{my_cipher.shift}: #{my_cipher.decryption.upcase}"
        KeyshiftManager.next(my_cipher)
    end
    print "Continue? (y/n) "
    condition = gets.chomp[0]
    condition.downcase! unless condition == nil
    if condition == nil || condition == "y"
        KeyshiftManager.reset(my_cipher)
        system("clear") || system("cls")
    else
        menu = false
    end
end
puts "Goodbye!"
