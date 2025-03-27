# frozen_string_literal: false

def substrings(string, dictionary)
  string.downcase! # Downcase the string so that it's case insensitive
  dictionary.each_with_object(Hash.new(0)) do |substr, hash|
    # this functionality is done by replacing the string with the uppercased substring
    # if something got replaced, that means that the string contains the substring in the dictionary
    string.split.each do |word|
      hash[substr] += 1 if word.sub(/#{substr}/i, substr.upcase) != word
    end
  end
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

p substrings("Howdy partner, sit down! How's it going?", dictionary)
