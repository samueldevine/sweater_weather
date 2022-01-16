# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Photo do
  before :each do
    @photo = Photo.new({
                         results: [
                           {
                             urls: {
                               raw: '',
                               full: ''
                             },
                             user: {
                               name: '',
                               links: {
                                 html: ''
                               }
                             }
                           }
                         ]
                       }, 'denver,co')
  end

  describe '#initialize' do
    it 'exists' do
      expect(@photo).to be_a Photo
    end

    it 'has readable attributes' do
      expect(@photo.id).to eq 'null'
      expect(@photo.image[:location]).to eq 'denver,co'
      expect(@photo.image[:image_url]).to eq ''
      expect(@photo.image[:credit][:source]).to eq 'unsplash.com'
      expect(@photo.image[:credit][:photographer]).to eq ''
      expect(@photo.image[:credit][:photographer_profile]).to eq ''
    end
  end
end
