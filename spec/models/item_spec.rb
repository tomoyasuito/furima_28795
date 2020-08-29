require 'rails_helper'

RSpec.describe "商品出品機能", type: :model do
  describe "#create" do
    before do
      #:userを新しい変数名に定義する
      user = FactoryBot.create(:user)
      #userはアソシエーションしてるので、user.idを定義する
      @item = FactoryBot.build(:item, user_id: user.id) 
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it "image,name,postage_id,area_id,category_id,status_id,price,sipping_chages_id,infoが存在すれば出品できる" do
      #binding.pry
      expect(@item).to be_valid
    end

    it "imageが空では出品できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to  include("Image can't be blank")
    end

    it "nameが空では出品できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "postage_idが空では出品できないこと" do
      @item.postage_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage is not a number")
    end

    it "area_idが空では出品できないこと" do
      @item.area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Area is not a number")
    end

    it "category_idが空では出品できいなこと" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end

    it "status_idが空では出品できないこと" do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status is not a number")
    end

    it "priceが空では出品できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "shipping_charges_idが空では出品できないこと" do
      @item.shipping_charges_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charges is not a number")
    end

    it "infoが空では出品できないこと" do
      @item.info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end

    it "価格の範囲が¥300以下では保存できないこと" do
      @item.price = "100"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 300")
    end

    it "価格の範囲が¥9,999,999以上では出品できないこと" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 9999999")
    end
  end
end

