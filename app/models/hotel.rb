# == Schema Information
#
# Table name: hotels
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Hotel < ApplicationRecord
  has_many :rooms
  has_many :bookings, through: :rooms
end
