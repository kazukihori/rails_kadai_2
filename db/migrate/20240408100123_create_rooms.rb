class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :room_introduction
      t.integer :price
      t.text :address
      t.text :room_img
      t.integer :user_id

      t.timestamps
    end
  end
end
