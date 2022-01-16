class PhotoService
  class << self
    def conn
      Faraday.new('https://api.unsplash.com/')
    end

    def parse_json(url, params, headers)
      JSON.parse(conn.get(url, params, headers).body, symbolize_names: true)
    end

    def get_background(location)
      url = 'search/photos'
      params = {
        client_id: ENV['unsplash_api_key'],
        query: location,
        page: 1,
        per_page: 1
      }
      headers = {
        'Accept-Version': 'v1'
      }

      parse_json(url, params, headers)
    end
  end
end
