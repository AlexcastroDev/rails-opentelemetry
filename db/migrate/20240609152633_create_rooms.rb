class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :reference
      t.integer :price

      t.belongs_to :hotel, index: true

      t.timestamps
    end
  end
end
