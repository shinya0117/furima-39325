class CreateInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :information do |t|
      t.string :postal_code,    null: false
      t.integer :prefecture_id, null: false
      t.string :municipalities, null: false
      t.string :street_address, null: false
      t.string :build_name
      t.string :tel,            null: false
      t.references :purchase, null: false, foreign_key: true
      t.timestamps
    end
  end
end
