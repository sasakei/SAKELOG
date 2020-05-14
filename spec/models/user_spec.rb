require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
      user = User.new(
        name: "sample",
        email: "sample@sample.com",
        password: "password1021",
        password_confirmation: "password1021"
      )
      expect(user).to be_valid
    end

    it 'nameが空では登録できないこと' do
      user = User.new(
        name: "",
        email: "sample@sample.com",
        password: "password1021",
        password_confirmation: "password1021"
      )
      user.valid?
      expect(user.errors.messages[:name]).to include( "can't be blank" )
    end

    it 'emailが空では登録できないこと' do
      user = User.new(
        name: "sample",
        email: "",
        password: "password1021",
        password_confirmation: "password1021"
      )
      user.valid?
      expect(user.errors.messages[:email]).to include( "can't be blank" )
    end

    it 'passwordが空では登録できないこと' do
      user = user = User.new(
        name: "sample",
        email: "sample@sample.com",
        password: "",
        password_confirmation: "password1021"
      )
      user.valid?
      expect(user.errors.messages[:password]).to include( "can't be blank" )
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      user = User.new(
        name: "sample",
        email: "sample@sample.com",
        password: "password1021",
        password_confirmation: ""
      )
      user.valid?
      expect(user.errors.messages[:password_confirmation]).to include( "doesn't match Password" )
    end

    it 'passwordとpassword_confirmationの値が異なる場合登録できないこと' do
      user = User.new(
        name: "sample",
        email: "sample@sample.com",
        password: "password1021",
        password_confirmation: "password1022"
      )
      user.valid?
      expect(user.errors.messages[:password_confirmation]).to include( "doesn't match Password" )
    end

    it 'nameが15文字より大きい場合登録できないこと' do
      user = User.new(
        name: "aaaaaaaaaaaaaaaa",
        email: "sample@sample.com",
        password: "password1021",
        password_confirmation: "password1021"
      )
      user.valid?
      expect(user.errors.messages[:name]).to include( "is too long (maximum is 15 characters)" )
    end

    it 'nameが15文字以下では登録できること' do
      user = User.new(
        name: "aaaaaaaaaaaaaaa",
        email: "sample@sample.com",
        password: "password1021",
        password_confirmation: "password1021"
      )
      expect(user).to be_valid
    end

    it '重複したemailが存在する場合登録できないこと' do
      user = User.new(
        name: "sample",
        email: "sample@sample.com",
        password: "password1021",
        password_confirmation: "password1021"
      )
      another_user = User.new(
        name: "sample",
        email: "sample@sample.com",
        password: "password1021",
        password_confirmation: "password1021"
      )
      another_user.valid?
      expect(another_user.errors.messages[:email]).to include( "is invalid" )
    end

    it 'passwordが6文字以上で文字列のみの場合登録できないこと' do
      user = User.new(
        name: "sample",
        email: "sample@sample.com",
        password: "password",
        password_confirmation: "password"
      )
      user.valid?
      expect(user.errors.messages[:password]).to include( "is invalid" )
    end

    it 'passwordが6文字以上で数字のみの場合登録できないこと' do
      user = User.new(
        name: "sample",
        email: "sample@sample.com",
        password: "11111111",
        password_confirmation: "11111111"
      )
      user.valid?
      expect(user.errors.messages[:password]).to include( "is invalid" )
    end

    it 'passwordが6文字未満であれば登録できないこと' do
      user = User.new(
        name: "sample",
        email: "sample@sample.com",
        password: "pass1",
        password_confirmation: "pass1"
      )
      user.valid?
      expect(user.errors.messages[:password]).to include( "is invalid" )
    end
  end
end
