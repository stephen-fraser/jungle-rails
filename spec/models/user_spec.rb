require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "Validations" do

    it 'is valid when all five mandatory fields are set' do
      @user = User.create(first_name: 'Job', last_name: "Bluth", email: 'blueman@example.com', password: 'password', password_confirmation: 'password')
      expect(@user).to be_valid
    end

    it 'is not valid when password and password confirmation do not match' do
      @user = User.create(first_name: 'Job', last_name: "Bluth", email: 'blueman@example.com', password: 'password', password_confirmation: 'notpassword')
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'is not valid when email is not set' do
      @user = User.create(first_name: 'Job', last_name: "Bluth", email: nil, password: 'password', password_confirmation: 'password')
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is not valid when password is not set' do
      @user = User.create(first_name: 'Job', last_name: "Bluth", email: 'blueman@example.com', password: nil, password_confirmation: 'password')
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'is not valid when password confirmation  is not set' do
      @user = User.create(first_name: 'Job', last_name: "Bluth", email: 'blueman@example.com', password: 'password', password_confirmation: nil)
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'is not valid when first_name not set' do
      @user = User.new(first_name: nil, last_name: "Bluth", email: 'blueman@example.com', password: 'password', password_confirmation: 'password')
      @user.save
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'is not valid when last_name not set' do
      @user = User.new(first_name: "Job", last_name: nil, email: 'blueman@example.com', password: 'password', password_confirmation: 'password')
      @user.save
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'is not valid if email already exists in the db' do
      @user1 = User.create(first_name: 'Job', last_name: "Bluth", email: 'BLUEMAN@example.com', password: 'password', password_confirmation: 'password')
      @user2 = User.create(first_name: 'Tobias', last_name: "Funke", email: 'blueman@example.com', password: 'password', password_confirmation: 'password')
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'is not valid if the password is less that 3 characters' do
      @user = User.create(first_name: "Job", last_name: "Bluth", email: 'blueman@example.com', password: '12', password_confirmation: '12')
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end

  end

  describe 'authenticate_with_credentials' do

    it 'should login user with valid credentials' do
      @user = User.create(first_name: 'Job', last_name: "Bluth", email: 'blueman@example.com', password: 'password', password_confirmation: 'password')
      @user_is_valid = User.authenticate_with_credentials('blueman@example.com', 'password')
      expect(@user_is_valid).to_not equal(nil)
    end

    it 'should login user with spaces around email' do
      @user = User.create(first_name: 'Job', last_name: "Bluth", email: 'blueman@example.com', password: 'password', password_confirmation: 'password')
      @user_is_valid = User.authenticate_with_credentials('  blueman@example.com  ', 'password')
      expect(@user_is_valid).to_not equal(nil)
    end

    it 'should login user if email is in upper or lower case' do
      @user = User.create(first_name: 'Job', last_name: "Bluth", email: 'blueman@example.com', password: 'password', password_confirmation: 'password')
      @user_is_valid = User.authenticate_with_credentials('BLueman@EXaMple.com', 'password')
      expect(@user_is_valid).to_not equal(nil)
    end

  end

end