class Pet < ApplicationRecord
  belongs_to :user
  # geocoded_by :location
  # after_validation :geocode, if: :will_save_change_to_address?
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
end
