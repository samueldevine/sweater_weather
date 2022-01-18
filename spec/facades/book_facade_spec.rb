require 'rails_helper'

RSpec.describe BookFacade do
  describe '::get_books', :vcr do
    it 'retrives a list of book objects that match the search param' do
      location = 'Denver,CO'
      quantity = 5
      payload = BookFacade.get_books(location, quantity)

      expect(payload).to have_key :total_books_found
      expect(payload[:books]).to be_an Array
      expect(payload[:books].length).to eq quantity

      payload[:books].each do |book|
        expect(book).to be_a Book
        expect(book.isbn).to be_an Array
        expect(book.title).to be_a String
        expect(book.publisher).to be_an Array
      end
    end
  end
end
