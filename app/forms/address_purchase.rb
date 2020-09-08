class AddressPurchase 
   
  include ActiveModel::Model
  attr_accessor :post_code, :city, :prefecture_id, :building_name, :phone_number, :address, :purchase_id, :user_id, :item_id, :token


  def save
    @purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Addrese.create(post_code: post_code, city: city, prefecture_id: prefecture_id, building_name: building_name, phone_number: phone_number, address: address, purchase_id: @purchase.id)
  end
  
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, length:{ minimum: 11 }
    validates :token
  end
end