require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'nameが空では登録できないこと' do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors.messages[:name]).to include( "can't be blank" )
    end

    it 'emailが空では登録できないこと' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors.messages[:email]).to include( "can't be blank" )
    end

    it 'passwordが空では登録できないこと' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors.messages[:password]).to include( "can't be blank" )
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      user = build(:user, password_confirmation: '')
      user.valid?
      expect(user.errors.messages[:password_confirmation]).to include( "doesn't match Password" )
    end

    it 'passwordとpassword_confirmationの値が異なる場合登録できないこと' do
      user = build(:user, password: 'password1021', password_confirmation: 'password1022')
      user.valid?
      expect(user.errors.messages[:password_confirmation]).to include( "doesn't match Password" )
    end

    it 'nameが15文字より大きい場合登録できないこと' do
      user = build(:user, name: "aaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors.messages[:name]).to include( "is too long (maximum is 15 characters)" )
    end

    it 'nameが15文字以下では登録できること' do
      user = build(:user, name: "aaaaaaaaaaaaaaa")
      expect(user).to be_valid
    end

    it '重複したemailが存在する場合登録できないこと' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors.messages[:email]).to include( "has already been taken" )
    end

    it 'passwordが6文字以上で文字列のみの場合登録できないこと' do
      user = build(:user, password: "password")
      user.valid?
      expect(user.errors.messages[:password]).to include( "is invalid" )
    end

    it 'passwordが6文字以上で数字のみの場合登録できないこと' do
      user = build(:user, password: "11111111")
      user.valid?
      expect(user.errors.messages[:password]).to include( "is invalid" )
    end

    it 'passwordが6文字未満であれば登録できないこと' do
      user = build(:user, password: "pass1")
      user.valid?
      expect(user.errors.messages[:password]).to include( "is invalid" )
    end
  end
end
