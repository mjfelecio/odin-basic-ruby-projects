def encrypt(str, shift)
  letters = %w[a b c d e f g h i j k l
               m n o p q r s t u v w x y z]

  # Try to convert the shift to integer and raise an error on fail
  begin
    shift = Integer(shift)
  rescue ArgumentError
    raise 'Invalid shift value: Only integers allowed'
  end

  encrypted_string = []

  str.each_char do |char| # Iterate through each character
    is_upcase = false
    is_upcase = true if char == char.upcase

    curr_idx = letters.index(char.downcase)

    # Ignore the character if it isn't a letter
    if curr_idx.nil?
      encrypted_string << char
      next
    end

    # Negative numbers shift the index to the left while positive to the right
    new_idx = (curr_idx + shift) % letters.length # Uses modulo to wrap the index on the array if it exceeds it
    shifted_char = is_upcase ? letters[new_idx].upcase : letters[new_idx]

    encrypted_string << shifted_char
  end

  encrypted_string.join('')
end

# ---------------------------------------------------------- #

puts '>-----Caesar Cypher-----<'
print 'What would you like to encrypt? '
string = gets.chomp

print 'Input the number of shifts for each letter: '
shift = gets.chomp

print 'Cipher Text: '
puts encrypt(string, shift)

# ---------------------------------------------------------- #
