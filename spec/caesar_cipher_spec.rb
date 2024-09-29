# caesar_cipher_spec.rb
# frozen_string_literal: true

require_relative '../lib/caesar_cipher'

# rubocop: disable Metrics/BlockLength
describe CaesarCipher do
  describe '#encrypted' do
    context 'when input is one word' do
      subject(:one_word) { described_class.new('caesar', 0, skip_intro: true) }

      it 'works with small positive shifts' do
        one_word.updated_shift(1)
        expect(one_word.encrypted).to eql('dbftbs')
      end

      it 'works with big positive shifts' do
        one_word.updated_shift(55)
        expect(one_word.encrypted).to eql('fdhvdu')
      end

      it 'works with small negative shifts' do
        one_word.updated_shift(-3)
        expect(one_word.encrypted).to eql('zxbpxo')
      end

      it 'works with big negative shifts' do
        one_word.updated_shift(-22)
        expect(one_word.encrypted).to eql('geiwev')
      end

      it 'works with zero' do
        one_word.updated_shift(0)
        expect(one_word.encrypted).to eql('caesar')
      end
    end

    context 'when user input is a sentence' do
      subject(:sentence) { described_class.new('foo', 10, skip_intro: true) }

      it 'works with sentences containing punctuation' do
        sentence.updated_string('All roads lead to Rome!')
        expect(sentence.encrypted).to eql('kvv byknc vokn dy bywo!')
      end

      it 'works with a sentence containing an apostrophe' do
        sentence.updated_string("You're a sexy beast Ruby... !?")
        expect(sentence.encrypted).to eql("iye'bo k cohi lokcd beli... !?")
      end
    end
  end
end
# rubocop: enable Metrics/BlockLength
