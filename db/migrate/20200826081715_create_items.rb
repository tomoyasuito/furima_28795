class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,             null: false, foreign_key: true
      t.string     :name,             null: false
      t.integer    :postage,          null: false
      t.integer    :area,             null: false
      t.integer    :category,         null: false
      t.integer    :status,           null: false
      t.integer    :price,            null: false
      t.integer    :shipping_charges, null: false
      t.text       :info,             null: false         
      t.timestamps
    end
  end
end
