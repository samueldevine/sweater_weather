require 'rails_helper'

RSpec.describe PhotoFacade do
  describe '::get_background_image' do
    it 'returns a photo object', :vcr do
      location = 'denver,co'
      photo = PhotoFacade.get_background(location)

      expect(photo).to be_a Photo
      expect(photo.image).to have_key :location
      expect(photo.image).to have_key :image_url
      expect(photo.image).to have_key :credit
      expect(photo.image[:credit]).to have_key :source
      expect(photo.image[:credit]).to have_key :photographer
      expect(photo.image[:credit]).to have_key :photographer_profile
    end
  end
end
