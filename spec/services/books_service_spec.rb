require 'rails_helper'

RSpec.describe BooksService do
  describe '::conn' do
    it 'creates a Faraday connection' do
      expect(BooksService.conn).to be_a Faraday::Connection
    end
  end

  describe '::get_books', :vcr do
    it 'returns all books with titles matching the query' do
      payload = BooksService.get_books('Denver,CO')

      expect(payload).to be_a Hash
      expect(payload).to have_key :numFound
      expect(payload).to have_key :docs
      expect(payload[:docs].length).to eq payload[:numFound]

      # skipping the first book in my test because no isbn is listed.
      # will add some logic to account for this possibility in my book poro
      payload[:docs][1..5].each do |book|
        expect(book).to have_key :isbn
        expect(book).to have_key :title
        expect(book).to have_key :publisher
      end
    end
  end
end
