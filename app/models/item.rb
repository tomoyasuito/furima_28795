class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :area
  belongs_to :user
  has_one_attached :image
  has_one :purchase


  #空の投稿を保存できないようにする
  validates :name, :info, :image, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, :postage_id, :shipping_charges_id, :area_id, numericality: { other_than: 1 } 
  
  #半角英数のみ入力可能であること
  with_options presence: true do
    validates      :price, format: {with: /\A[0-9]+\z/}  
  end
   #価格に範囲が¥300~¥9,999,999の間であること
   validates      :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }
end
