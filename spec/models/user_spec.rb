require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create valid user when receiving all required fields' do
      user = User.create(
        name: "Dan",
        email: "dan@dan.com",
        password: "woof",
        password_confirmation: "woof"
        )
      expect(user).to (be_valid)
    end
    
    it 'should not be valid without password confirmation' do
      user = User.create(
        name: "Dan",
        email: "dan@dan.com",
        password: "woof",
        password_confirmation: "roof roof"
        )
      expect(user).to_not (be_valid)
    end

    it 'should not save with duplicative email' do
      @user = User.create(
        name: "Dan",
        email: "dan@dan.com",
        password: "woof",
        password_confirmation: "woof"
      )
      @user2 = User.create(
        name: "Dan",
        email: "DAN@DAN.COM",
        password: "yeah",
        password_confirmation: "yeah"
        )
      
      expect(@user2).to_not be_valid
    end

    it 'should have matching password and password confirmation' do
      password = User.create(
        name: "Dan",
        email: "DAN@DAN.COM",
        password: "okok",
        password_confirmation: "yeah, good"
        )
      expect(password).to_not be_equal(password.password_confirmation)
    end

    it 'should have name to be a valid user' do
      user = User.create(
        name: nil,
        email: "DAN@DAN.COM",
        password: "okok",
        password_confirmation: "okok")
      expect(user).to_not (be_valid)
    end

    it 'should have a password with a minimum length of 3' do
      user = User.create(
        name: "Dan",
        email: "DAN@DAN.COM",
        password: "ah",
        password_confirmation: "ah"
        )
      expect(user).to_not be_valid
    end
  end
    
  describe '.authenticate_with_credentials' do
    it 'should authenticate a valid user' do
      user = User.create(
        name: "Dan",
        email: "dan@dan.com",
        password: "woof",
        password_confirmation: "woof"
        )
      authenticate = User.authenticate_with_credentials(user.email, user.password)
      expect(authenticate).to eq(user)
    end
    
    it 'should authenticate a valid user with extra spaces' do
      user = User.create(
        name: "Dan",
        email: "example@domain.com",
        password: "woof",
        password_confirmation: "woof"
        )
      authenticate = User.authenticate_with_credentials(" example@domain.com ", user.password)
      expect(authenticate).to eq(user)
    end

    it 'should authenticate a valid user with wrong case' do
      user = User.create(
        name: "Dan",
        email: "eXample@domain.COM",
        password: "woof",
        password_confirmation: "woof"
        )
      authenticate = User.authenticate_with_credentials("EXAMPLe@DOMAIN.CoM", user.password)
      expect(authenticate).to eq(user)
    end
  end
end