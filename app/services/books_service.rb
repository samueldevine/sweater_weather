class BooksService
  class << self
    def conn
      Faraday.new('http://openlibrary.org/')
    end

    def parse_json(url, params)
      JSON.parse(conn.get(url, params).body, symbolize_names: true)
    end

    def get_books(location)
      url = '/search.json'
      params = {
        title: location
      }
      parse_json(url, params)
    end
  end
end
