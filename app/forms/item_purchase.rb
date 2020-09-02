class ItemPurchase
   
  incrude ActiveModel::Model
  attr_accessor :post_code, :city, :prefecture, :building_name, :phone_number, :address, :purchase


  def save
    Address.create(post_code: post_code, city: city, prefecture: prefecture, building_name: building_name, phone_number: phone_number, address: address, purchase: purchase)
  end
end