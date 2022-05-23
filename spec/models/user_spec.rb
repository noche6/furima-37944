require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
   context "登録できるとき" do
    it "正しく入力されていれば登録できる" do
      expect(@user).to be_valid
    end
   end
   context "登録できないとき" do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'first(全角)が空では登録できない'do
      @user.first_name_zenkaku = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name zenkaku can't be blank"
    end
    it 'first(全角)でなければ登録できない'do
      @user.first_name_zenkaku = 'hannkaku'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name zenkaku is invalid"
    end
    it 'last(全角)が空では登録できない' do
      @user.last_name_zenkaku = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name zenkaku can't be blank"
    end
    it 'last(全角)でなければ登録できない'do
      @user.last_name_zenkaku = 'hannkaku'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name zenkaku is invalid"
    end
    it 'first(全角カナ)が空では登録できない' do
      @user.first_name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name katakana can't be blank"
    end
    it 'first(全角カナ)でなければ登録できない' do
      @user.first_name_katakana = '全角'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name katakana is invalid"
    end
    it 'last(全角カナ)が空では登録できない' do
      @user.last_name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name katakana can't be blank"
    end
    it 'last(全角カナ)でなければ登録できない' do
      @user.last_name_katakana = '全角'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name katakana is invalid"
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが6文字以上でないと登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '英字のみのパスワードでは登録できない' do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '数字のみのパスワードでは登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '全角文字を含むパスワードでは登録できない' do
      @user.password = 'AAAAAA'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  end
end
