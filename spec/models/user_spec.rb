require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'will be valid with valid inputs' do
      @user = User.new(first_name: 'Allan', last_name: 'Rickman', email: 'A_Rickman@gmail.com', password: 'mrPotter?@', password_confirmation: 'mrPotter?@')
      @user.valid?
      expect(@user.errors.messages).to eq({})
    end

    it 'will not be valid if email is blank' do

      @user = User.new(first_name: 'Allan', last_name: 'Rickman', email: nil, password: 'mrPotter?@', password_confirmation: 'mrPotter?@')
      @user.valid?
      expect(@user.errors.messages[:email]).to include("can't be blank")
    end


    it 'will not be valid if first name is blank' do
      @user = User.new(first_name: nil, last_name: 'Rickman', email: 'A_Rickman@gmail.com', password: 'mrPotter?@', password_confirmation: 'mrPotter?@')
      @user.valid?
      expect(@user.errors.messages[:first_name]).to include("can't be blank")
    end


    it 'will not be valid if last name is blank' do
      @user = User.new(first_name: 'Allan', last_name: nil, email: 'A_Rickman@gmail.com', password: 'mrPotter?@', password_confirmation: 'mrPotter?@')
      @user.valid?
      expect(@user.errors.messages[:last_name]).to include("can't be blank")
    end

    it 'will not be valid if password is blank' do
      @user = User.new(first_name: 'Allan', last_name: 'Rickman', email: 'A_Rickman@gmail.com', password: nil, password_confirmation: 'mrPotter?@')
      @user.valid?
      expect(@user.errors.messages[:password]).to include("can't be blank")
    end

    it 'will not be valid if password confirmation is blank' do
      @user = User.new(first_name: 'Allan', last_name: 'Rickman', email: 'A_Rickman@gmail.com', password: 'mrPotter?@', password_confirmation: nil)
      @user.valid?
      expect(@user.errors.messages[:password_confirmation]).to include("can't be blank")
    end

    it 'will not be valid if password does not match password confirmation' do
      @user = User.new(first_name: 'Allan', last_name: 'Rickman', email: 'A_Rickman@gmail.com', password: 'mrPotter?@', password_confirmation: 'banana')
      @user.valid?
      expect(@user.errors.messages[:password_confirmation]).to include("doesn't match Password")
    end

    it 'will not be valid if the email exists in the database' do
      @user = User.new(first_name: 'Allan', last_name: 'Rickman', email: 'test@gmail.com', password: 'mrPotter?@', password_confirmation: 'mrPotter?@')
      @user.save
      @user_dup = User.new(first_name: 'Allan', last_name: 'Rickman', email: 'test@gmail.com', password: 'mrPotter?@', password_confirmation: 'mrPotter?@')
      @user_dup.valid?
      expect(@user_dup.errors.messages[:email]).to include("has already been taken")
    end

    it 'will not be valid if a case-insensitive email match exists in the database' do
      @user = User.new(first_name: 'Allan', last_name: 'Rickman', email: 'TEST@gmail.com', password: 'mrPotter?@', password_confirmation: 'mrPotter?@')
      @user.save
      @user_dup = User.new(first_name: 'Allan', last_name: 'Rickman', email: 'test@gmail.com', password: 'mrPotter?@', password_confirmation: 'mrPotter?@')
      @user_dup.valid?
      expect(@user_dup.errors.messages[:email]).to include("has already been taken")
    end
    
    it 'will be valid with leading or trailing spaces around the email' do
      @user = User.new(first_name: 'Allan', last_name: 'Rickman', email: '   test@gmail.com ', password: 'mrPotter?@', password_confirmation: 'mrPotter?@')
      @user.save
      expect(@user.errors.messages).to eq({})
    end

    it 'will not be valid if the password is less than 8 characters' do
      @user = User.new(first_name: 'Allan', last_name: 'Rickman', email: 'TEST@gmail.com', password: 'hiDad', password_confirmation: 'hiDad')
      @user.valid?
      expect(@user.errors.messages[:password]).to include("is too short (minimum is 8 characters)")
    end


  end

  describe '.authenticate_with_credentials' do

    it 'returns the matching user from the db if the credentials are correct' do
      @user = User.new(first_name: 'Allan', last_name: 'Rickman', email: 'TEST@gmail.com', password: 'mrPotter?@', password_confirmation: 'mrPotter?@')
      @user.save
      @email = 'test@gmail.com'
      @password = 'mrPotter?@'
      @authenticated = User.authenticate_with_credentials(@email, @password)

      expect(@authenticated.email).to eq(@email)
      expect(@authenticated.password_digest).to_not eq(@password)
    end
    
    it 'does not return a user if the credentials are incorrect' do
      @user = User.new(first_name: 'Allan', last_name: 'Rickman', email: 'TEST@gmail.com', password: 'mrPotter?@', password_confirmation: 'mrPotter?@')
      @user.save
      @email = 'test@gmail.com'
      @password = 'OhHeyThereItsNotThePassword'
      @authenticated = User.authenticate_with_credentials(@email, @password)

      expect(@authenticated).to eq(false)
    end

  end

end