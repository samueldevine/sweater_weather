# frozen_string_literal: true

class Book
  attr_reader :isbn,
              :title,
              :publisher

  def initialize(data)
    @isbn = data[:isbn] || ['isbn unavailable for this book']

    @title     = data[:title]
    @publisher = data[:publisher]
  end
end
