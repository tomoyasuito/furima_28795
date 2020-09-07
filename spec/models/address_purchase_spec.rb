require 'rails_helper'

RSpec.describe AddressPurchase, type: :model do
  describe '商品購入機能' do
    before do
    @address_purchase = FactoryBot.build(:address_purchase)
  end

  it "全ての値が正しく入力されていれば保存できること" do
    expect(@address_purchase).to be_valid
  end

  it "post_codeが空では購入できないこと" do
    @address_purchase.post_code = nil
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include("Post code can't be blank")
  end

  it "tokenが空では購入できないこと" do
    @address_purchase.token = nil
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include("Token can't be blank")
  end

  it "cityが空では購入できないこと"do
    @address_purchase.city = nil
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include("City can't be blank")
  end

  it "prefectureが[--]では購入できないこと" do
    @address_purchase.prefecture_id = "1"
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include("Prefecture must be other than 1")
  end

  it "phone_numberが空では購入できないこと" do
    @address_purchase.phone_number = nil
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include("Phone number can't be blank")
  end

  it "addressが空では購入できないこと" do
    @address_purchase.address = nil
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include("Address can't be blank")
  end

  it "post_codeにはハイフンがなければ購入できないこと" do
    @address_purchase.post_code = "1234567"
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include("Post code is invalid")
  end

  it "phone_numberは１１文字以内でなければ購入できないこと" do 
    @address_purchase.phone_number = "09000"
    @address_purchase.valid?
    expect(@address_purchase.errors.full_messages).to include("Phone number is too short (minimum is 11 characters)")
  end
 end
end
