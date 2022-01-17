require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
  end

  describe 'callbacks' do
    describe 'api_key generation' do
      it 'generates a random api key without special characters' do
        user_1 = User.create(email: 'user_1@gmail.com', password: 'user_1', password_confirmation: 'user_1')
        user_2 = User.create(email: 'user_2@gmail.com', password: 'user_2', password_confirmation: 'user_2')
        user_3 = User.create(email: 'user_3@gmail.com', password: 'user_3', password_confirmation: 'user_3')
        user_4 = User.create(email: 'user_4@gmail.com', password: 'user_4', password_confirmation: 'user_4')
        user_5 = User.create(email: 'user_5@gmail.com', password: 'user_5', password_confirmation: 'user_5')
        user_6 = User.create(email: 'user_6@gmail.com', password: 'user_6', password_confirmation: 'user_6')
        user_7 = User.create(email: 'user_7@gmail.com', password: 'user_7', password_confirmation: 'user_7')
        user_8 = User.create(email: 'user_8@gmail.com', password: 'user_8', password_confirmation: 'user_8')
        user_9 = User.create(email: 'user_9@gmail.com', password: 'user_9', password_confirmation: 'user_9')
        user_10 = User.create(email: 'user_10@gmail.com', password: 'user_10', password_confirmation: 'user_10')

        expect(user_1.api_key).to_not eq user_2.api_key
        expect(user_1.api_key).to_not eq user_3.api_key
        expect(user_1.api_key).to_not eq user_4.api_key
        expect(user_1.api_key).to_not eq user_5.api_key
        expect(user_1.api_key).to_not eq user_6.api_key
        expect(user_1.api_key).to_not eq user_7.api_key
        expect(user_1.api_key).to_not eq user_8.api_key
        expect(user_1.api_key).to_not eq user_9.api_key
        expect(user_1.api_key).to_not eq user_10.api_key
      end
    end
  end
end
