

def encrypt(str, shift)
  letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
   "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

  # Try to convert the shift to integer and raise an error on fail
  begin
    shift = Integer(shift)
  rescue ArgumentError
    raise "Invalid shift value: Only integers allowed"
  end

  encryptedString = ""

  str.each_char do |char| # Iterate through each character
    isUpcase = false
    isUpcase = true if(char == char.upcase)

    currIndex = letters.index(char.downcase)
    
    # Ignore the character if it isn't a letter
    if currIndex == nil 
      encryptedString += char
      next
    end

    # Negative numbers shift the index to the left while positive to the right
    newIndex = currIndex + shift
    newIndex = newIndex % letters.length # Uses modulo to wrap the index on the array if it exceeds it
      
    newLetter = isUpcase ? letters[newIndex].upcase : letters[newIndex]

    encryptedString += newLetter
  end

  return encryptedString
end

# ---------------------------------------------------------- #

puts ">-----Caesar Cypher-----<"
print "What would you like to encrypt? "
string = gets.chomp

print "Input the number of shifts for each letter: "
shift = gets.chomp

print "Cipher Text: "
puts encrypt(string, shift)

# ---------------------------------------------------------- #
