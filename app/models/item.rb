class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :postage, :shipping_charge, :area

  #空の投稿を保存できないようにする
  validates :name, :info, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category, :status, :postage, :shipping_charge, :area, numericality: { other_than: 1 } 
end
