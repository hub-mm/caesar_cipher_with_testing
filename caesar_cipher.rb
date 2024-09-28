# frozen_string_literal: true

puts 'Input some text:'
string = gets.chomp

puts "\n"
puts 'Input a number:'
num = gets.to_i

puts "\n"
puts 'Here is your code:'
def caesar_cipher(string, num)
  lower_alphabet = ('a'..'z').to_a
  upper_alphabet = ('A'..'Z').to_a
  code = []

  string.each_char do |char|
    if lower_alphabet.include?(char)
      index = lower_alphabet.index(char)
      offset = (index + num) % 26
      code << lower_alphabet[offset]
    elsif upper_alphabet.include?(char)
      index = upper_alphabet.index(char)
      offset = (index + num) % 26
      code << upper_alphabet[offset]
    else
      code << char
    end
  end

  code.join
end

puts caesar_cipher(string, num)
