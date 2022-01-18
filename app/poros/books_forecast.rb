class BooksForecast
  attr_reader :id,
              :destination,
              :forecast,
              :total_books_found,
              :books

  def initialize(books_data, forecast_data)
    @id                = 'null'
    @destination       = forecast_data[:destination]
    @forecast          = forecast_data[:forecast]
    @total_books_found = books_data[:total_books_found]
    @books             = books_data[:books]
  end
end
