class AddressPurchase 
   
  include ActiveModel::Model
  attr_accessor :post_code, :city, :prefecture_id, :building_name, :phone_number, :address, :purchase, :user, :item


  def save
    Addrese.create(post_code: post_code, city: city, prefecture_id: prefecture_id, building_name: building_name, phone_number: phone_number, address: address, purchase: purchase)
    Purchase.create(item: item, user: user)
  end
end