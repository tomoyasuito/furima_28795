require 'rails_helper'

RSpec.describe "ユーザーログイン機能", type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
   end

   it "nicknameとemail、first_nameとlast_name、first_name_kanaとlast_name_kana、passwordとpassword_confirmation,dateが存在すれば登録できること" do
    expect(@user).to be_valid
   end

   it "nicknameが空では登録できないこと" do
    @user.nickname = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
   end
     
   it "emailが空では登録できないこと" do
     @user.email = nil
     @user.valid?
     expect(@user.errors.full_messages).to include ("Email can't be blank")
   end

   it "first_nameが空では登録できないこと" do
     @user.first_name = nil
     @user.valid?
     expect(@user.errors.full_messages).to include ("First name can't be blank")
   end

   it "last_nameが空では登録できないこと" do
    @user.last_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include ("Last name can't be blank")
   end

   it "first_name_kanaが空では登録できないこと" do
    @user.first_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include ("First name kana can't be blank")
   end

   it "last_name_kanaが空では登録できないこと" do
    @user.last_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include ("Last name kana can't be blank")
   end

   it "passwordが空では登録できないこと" do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include ("Password can't be blank")
   end

   it "password_confirmationが空では登録できないこと" do
    @user.password_confirmation = ""
    @user.valid?
     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
   end

     it "dateが空では登録できないこと" do
       @user.date = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("Date can't be blank")
     end

     it "passwordが５文字以下であれば登録できないこと" do
       @user.password = "a1234"
       @user.password_confirmation = "@1234"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end

     it "passwordが英数字混合でなければ登録できないこと" do
       @user.password ="1234567"
       @user.password_confirmation = "1234567"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is invalid")
     end

     it "重複したemailが存在する場合登録できないこと" do
       @user.save
       another_user = FactoryBot.build(:user, email: @user.email)
       another_user.valid?
       expect(another_user.errors.full_messages).to include("Email has already been taken")
     end

     it "ユーザー本名(first_name)が全角（漢字・ひらがな・カタカナ）でなければ登録できないこと" do
       @user.first_name = "abe"
       @user.valid?
       expect(@user.errors.full_messages).to include("First name is invalid")
     end

     it "ユーザー本名(last_name)が全角（漢字・ひらがな・カタカナ）でなければ登録できないこと" do
       @user.last_name = "tarou"
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name is invalid")
     end

     it "ユーザ本名のフリガナ(first_name_kana)がカタカナでなければ登録できないこと" do
       @user.first_name_kana = "あべ"
       @user.valid?
       expect(@user.errors.full_messages).to include("First name kana is invalid")
     end

     it "ユーザー本名のフリガナ（last_name_kana)がカタカナでなければ登録できないこと" do
       @user.last_name_kana = "たろう"
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name kana is invalid")
     end
  end
end
