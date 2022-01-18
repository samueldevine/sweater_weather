# frozen_string_literal: true

class BookForecastSerializer
  include JSONAPI::Serializer

  set_type :books

  attributes :destination, :forecast, :total_books_found, :books
end
