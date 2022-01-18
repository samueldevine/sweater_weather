require 'rails_helper'

RSpec.describe Book do
  describe '#initialize' do
    before :each do
      @book = Book.new(
        {
          isbn: ['1234567890123'],
          title: 'ABC',
          publisher: ['XYZ']
        }
      )
    end

    it 'exists' do
      expect(@book).to be_a Book
    end

    it 'has readable attributes' do
      expect(@book.isbn).to eq ['1234567890123']
      expect(@book.title).to eq 'ABC'
      expect(@book.publisher).to eq ['XYZ']
    end

    it 'fills isbn with a string if none is provided' do
      book_2 = Book.new({ title: 'DEF', publisher: ['XYZ'] })

      expect(book_2).to be_a Book
      expect(book_2.isbn).to eq ['isbn unavailable for this book']
    end
  end
end
