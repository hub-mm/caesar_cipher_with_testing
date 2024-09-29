# caesar_cipher.rb
# frozen_string_literal: true

# Class creates Caesar Cipher
class CaesarCipher
  ALPHABET = ('a'..'z').to_a

  def initialize
    @string = user_input_string
    @number = user_input_number
    @code = []
    cipher
  end

  def user_input_string
    print 'Input: '
    gets.chomp.downcase
  end

  def user_input_number
    print 'Shift: '
    gets.to_i
  end

  def cipher
    @string.each_char do |char|
      if ALPHABET.include?(char)
        index = ALPHABET.index(char)
        shift = (@number + index) % 26
        @code << ALPHABET[shift]
      else
        @code << char
      end
    end

    puts "\e[31m\n#{@code.join}\n\e[0m"
  end
end
