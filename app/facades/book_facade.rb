class BookFacade
  class << self
    def get_books(location, quantity)
      payload = BookService.get_books(location)

      books_arr = payload[:docs][0..(quantity - 1)].map do |book|
        Book.new(book)
      end

      {
        total_books_found: payload[:numFound],
        books: books_arr
      }
    end
  end
end
