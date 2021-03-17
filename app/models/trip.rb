class Trip < ApplicationRecord
  has_many :bookings
  has_many :trip_activities
  has_many :activities, through: :trip_activities
  has_many :to_dos
  belongs_to :user


  scope :current_trip, -> { where("begin_date <= ?", Date.current).where("end_date >= ?", Date.current) }
end

