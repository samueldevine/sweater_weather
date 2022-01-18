class Book
  attr_reader :isbn,
              :title,
              :publisher

  def initialize(data)
    @title = data[:title]
    @publisher = data[:publisher]

    if data[:isbn]
      @isbn = data[:isbn]
    else
      @isbn = ['isbn unavailable for this book']
    end
  end
end
