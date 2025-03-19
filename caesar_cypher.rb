

def encrypt(str, shift)
  letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
   "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

  encryptedString = ""

  str.each_char do |char| # Iterate through each character
    isUpcase = false
    isUpcase = true if(char == char.upcase)

    currIndex = letters.index(char.downcase) # Gets its index on the lookup array above
    
    # Ignore the character if it isn't a letter
    if currIndex == nil 
      encryptedString += char
      next
    end

    # New index with the shift applied (Default is right)
    newIndex = shift_direction == "right" ? (currIndex + shift) : (currIndex - shift)

    while newIndex >= letters.length - 1 || newIndex <= -(letters.length)
      newIndex -= 26 if newIndex >= letters.length - 1
      newIndex += 26 if newIndex <= -(letters.length)
    end
    
    newLetter = isUpcase ? letters[newIndex].upcase : letters[newIndex] # Upcase if the original letter is upcase

    encryptedString += newLetter # Gets the corresponding letter according to the shift value
  end

  return encryptedString
end

def decrypt(str, shift, shift_direction = "left")
  if (shift_direction != "right" && shift_direction != "left")
    raise "Invalid shift direction. Only the default 'right' or 'left' is allowed." 
  end

  letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
   "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

  decryptedString = ""

  str.each_char do |char| # Iterate through each character
    isUpcase = false
    isUpcase = true if char == char.upcase 

    currIndex = letters.index(char.downcase) # Gets its index on the lookup array above

    if currIndex == nil # Skips the character if it isn't a letter
      decryptedString += char
      next
    end

    # New index with the shift applied (Default is left)
    newIndex = shift_direction == "left" ? (currIndex - shift) : (currIndex + shift) 

    # Wraps the letters if the newIndex is beyond z
    while newIndex >= letters.length - 1
      newIndex -= 26
    end

    # Gets the corresponding letter according to the shift value
    newLetter = isUpcase ? letters[newIndex].upcase : letters[newIndex] # Upcase if the original letter is upcase

    decryptedString += newLetter
  end

  return decryptedString
end

# ---------------------------------------------------------- #

puts ">-----Caesar Cypher-----<"
print "What would you like to encrypt? "
string = gets.chomp
print "Input the number of shifts for each letter: "
shift = gets.chomp.to_i

print "Encryption: "
puts encrypted_string = encrypt(string, shift)
# print "Left Shifted Encryption: "
# puts left_encrypted_string = encrypt(string, shift, "left") # Optional shift_direction argument

# puts "\n"
# print "Decryption: "
# puts decrypt(encrypted_string, shift)
# print "Left Shifted Decryption: "
# puts decrypt(left_encrypted_string, shift, "right") # Decrypting a left shifted caesar cypher


# ---------------------------------------------------------- #
