# == Schema Information
#
# Table name: bookings
#
#  id          :bigint           not null, primary key
#  check_in    :datetime
#  check_out   :datetime
#  total_price :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  room_id     :bigint
#
# Indexes
#
#  index_bookings_on_room_id  (room_id)
#
class Booking < ApplicationRecord
  belongs_to :room

  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :total_price, presence: true
  validates :room, presence: true
end
