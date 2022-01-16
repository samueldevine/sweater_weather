require 'rails_helper'

RSpec.describe PhotoService do
  describe '::conn' do
    it 'created a Faraday connection' do
      expect(PhotoService.conn).to be_a Faraday::Connection
    end
  end

  describe '::get_background', :vcr do
    it 'gets a single image that matches the query' do
      payload = PhotoService.get_background('denver,co')

      expect(payload).to have_key :results
      expect(payload[:results].length).to eq 1
      expect(payload[:results].first).to have_key :urls
      expect(payload[:results].first[:urls]).to have_key :raw
      expect(payload[:results].first).to have_key :user
      expect(payload[:results].first[:user]).to have_key :name
      expect(payload[:results].first[:user]).to have_key :links
      expect(payload[:results].first[:user][:links]).to have_key :html
    end
  end
end
