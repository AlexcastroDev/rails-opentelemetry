# == Schema Information
#
# Table name: rooms
#
#  id         :bigint           not null, primary key
#  name       :string
#  price      :integer
#  reference  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  hotel_id   :bigint
#
# Indexes
#
#  index_rooms_on_hotel_id  (hotel_id)
#
class Room < ApplicationRecord
  belongs_to :hotel
  has_many :bookings

  validates :name, presence: true
  validates :price, presence: true
  validates :reference, presence: true
  validates :hotel, presence: true
end
