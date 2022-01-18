class BooksForecastsFacade
  class << self
    def get_books(location, quantity)
      payload = BooksService.get_books(location)

      books_arr = payload[:docs][0..(quantity.to_i - 1)].map do |book|
        Book.new(book)
      end

      {
        total_books_found: payload[:numFound],
        books: books_arr
      }
    end

    def get_forecast(location)
      coordinates = MapFacade.get_coordinates(location)
      weather = WeatherFacade.get_weather_data(coordinates[:lat], coordinates[:lng])
      {
        destination: location,
        forecast: {
          summary: weather.current_weather[:conditions],
          temperature: weather.current_weather[:temperature]
        }
      }
    end

    def concat_books_and_forecast(location, quantity)
      books_data = get_books(location, quantity)
      forecast_data = get_forecast(location)

      BooksForecast.new(books_data, forecast_data)
    end
  end
end
