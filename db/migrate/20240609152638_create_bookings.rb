class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.datetime :check_in
      t.datetime :check_out
      t.integer :total_price

      t.belongs_to :room, index: true

      t.timestamps
    end
  end
end
