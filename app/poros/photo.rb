class Photo
  attr_reader :id,
              :image

  def initialize(data, query)
    @id = 'null'
    @image = {
      location: query,
      image_url: data[:results].first[:urls][:raw],
      credit: {
        source: 'unsplash.com',
        photographer: data[:results].first[:user][:name],
        photographer_profile: data[:results].first[:user][:links][:html]
      }
    }
  end
end
