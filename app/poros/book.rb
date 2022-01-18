class Book
  attr_reader :isbn,
              :title,
              :publisher

  def initialize(data)
    if data[:isbn]
      @isbn    = data[:isbn]
    else
      @isbn    = ['isbn unavailable for this book']
    end

    @title     = data[:title]
    @publisher = data[:publisher]
  end
end
