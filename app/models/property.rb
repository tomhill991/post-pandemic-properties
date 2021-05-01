class Property < ApplicationRecord
  belongs_to :users
  has_many :reviews, through: :bookings, dependent: :destroy
  has_many :images, { as: :imageable }, dependent: :destroy
  validates :max_guests, presence: true
  validates :office_size, presence: true
  validates :title, length: { maximum: 100 }, allow_blank: false, presence: true
  validates :description, length: { maximum: 250 }, allow_blank: false, presence: true
end

create_table "properties", force: :cascade do |t|
  t.integer "max_guests"
  t.integer "office_size"
  t.float "latitude"
  t.float "longitude"
  t.string "title"
  t.string "description"
  t.string "string"
  t.float "average_rating"
  t.boolean "has_beach_nearby"
  t.boolean "has_beds"
  t.boolean "has_kitchen"
  t.boolean "has_swimming_pool"
  t.boolean "has_hdtv"
  t.boolean "has_bathtub"
  t.datetime "created_at", precision: 6, null: false
  t.datetime "updated_at", precision: 6, null: false
  t.bigint "user_id"
  t.index ["user_id"], name: "index_properties_on_user_id"
end
