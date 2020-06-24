require 'rails_helper'

RSpec.describe User, type: :model do



  describe '正常値のテスト' do
    it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
      user = build(:user)
      expect(user).to be_valid
    end
  end

  describe 'nameのバリデーション' do

    it 'nameが空では登録できないこと' do
      user = build(:user, name: '')
      user.valid?
      expect(user.errors.messages[:name]).to include( "を入力してください" )
    end

    it 'nameが15文字より大きい場合登録できないこと' do
      user = build(:user, name: "aaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors.messages[:name]).to include( "は15文字以内で入力してください" )
    end

    it 'nameが15文字以下では登録できること' do
      user = build(:user, name: "aaaaaaaaaaaaaaa")
      expect(user).to be_valid
    end

  end

  describe 'emailのバリデーション' do

    it 'emailが空では登録できないこと' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors.messages[:email]).to include( "を入力してください" )
    end

    it '重複したemailが存在する場合登録できないこと' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors.messages[:email]).to include( "はすでに存在します" )
    end

  end

  describe 'passwordのバリデーション' do
    it 'passwordが空では登録できないこと' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors.messages[:password]).to include( "を入力してください" )
    end

    it 'passwordが6文字以上で文字列のみの場合登録できないこと' do
      user = build(:user, password: "password")
      user.valid?
      expect(user.errors.messages[:password]).to include( "は不正な値です" )
    end

    it 'passwordが6文字以上で数字のみの場合登録できないこと' do
      user = build(:user, password: "11111111")
      user.valid?
      expect(user.errors.messages[:password]).to include( "は不正な値です" )
    end

    it 'passwordが6文字未満の場合登録できないこと' do
      user = build(:user, password: "pass1")
      user.valid?
      expect(user.errors.messages[:password]).to include( "は6文字以上で入力してください", "は不正な値です" )
    end
  end


  describe 'password_confirmationのバリデーション' do
    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      user = build(:user, password_confirmation: '')
      user.valid?
      expect(user.errors.messages[:password_confirmation]).to include( "とPasswordの入力が一致しません" )
    end

    it 'passwordとpassword_confirmationの値が異なる場合登録できないこと' do
      user = build(:user, password: 'password1021', password_confirmation: 'password1022')
      user.valid?
      expect(user.errors.messages[:password_confirmation]).to include( "とPasswordの入力が一致しません" )
    end
  end

end
