# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

50.times do |i|
  h = Hotel.find_or_create_by!(name: "Hotel #{i + 1}")

  10.times do |i|
    Room.find_or_create_by!(name: "Room #{i + 4}", reference: "R#{i + 4}", price: 400 + i, hotel: h)
  end

  3.times do |i|
    Booking.find_or_create_by!(check_in: Time.now, check_out: Time.now + 1.day, total_price: 400 + i, room: Room.first)
  end
end
