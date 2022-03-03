class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode, if: :will_save_change_to_address?
  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :category, presence: true
end
