class Property < ApplicationRecord
  belongs_to :users
  has_many :reviews, through: :bookings, dependent: :destroy
  has_many :images, { as: :imageable }, dependent: :destroy
  validates :max_guests, presence: true
  validates :office_size, presence: true
  validates :title, length: { maximum: 100 }, allow_blank: false, presence: true
  validates :description, length: { maximum: 250 }, allow_blank: false, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
