class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.integer :pin_code
      t.text :street_address
      t.string :landmark
      t.string :city
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
