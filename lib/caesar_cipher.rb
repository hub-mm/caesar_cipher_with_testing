# caesar_cipher.rb
# frozen_string_literal: true

# Class creates Caesar Cipher
class CaesarCipher
  ALPHABET = ('a'..'z').to_a

  def initialize
    introduction
    @string = user_input_string
    @number = user_input_number
    @code = []
    cipher
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

  private

  def introduction
    puts "
    \e[31mCAESAR CIPHER\e[0m

    This is code which will output a word or sentence into as a caesar cipher.
    A Caesar Cipher consists of moving each letter of a given input forward in the
    alphabet by a set amount of letters.

    For instance if the number being moved along is 3, A = D, L = O and so on.

    You will be asked for an \e[31mInput\e[0m which consists of a string and
    a \e[31mShift\e[0m which is a number relating the how much you want to shift each letter by.

    Enjoy and happy coding!
    "
  end

  def user_input_string
    print 'Input: '
    gets.chomp.downcase
  end

  def user_input_number
    print 'Shift: '
    gets.to_i
  end
end
