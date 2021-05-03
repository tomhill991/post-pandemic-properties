# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"

User.destroy_all
Property.destroy_all


puts 'Creating 1 fake user....'
user = User.new(
    email: 'tom.hill991@gmail.com',
    password: "fakepassword"
)

addresses = ['47 Main Road, London', '138 Kingsland Road, London', '30 Cavendish Avenue, Essex', '85 Chelmsford Road, London']


puts 'Creating 3 fake users....'
3.times do
  user = User.create(
    :email  => Faker::Internet.email,
    :password  => "fakepassword"
  )

    puts 'Creating 1 property'
    boolean = [true, false]
    property = Property.create(
        :max_guests  => rand(1...10),
        :office_size  => rand(20...50),
        :address  => addresses.sample,
        :title  => Faker::Company.bs,
        :description  => Faker::Lorem.paragraph(sentence_count: 3),
        :has_beach_nearby  => boolean.sample,
        :has_beds  => boolean.sample,
        :has_kitchen  => boolean.sample,
        :has_swimming_pool  => boolean.sample,
        :has_hdtv  => boolean.sample,
        :has_bathtub  => boolean.sample,
        :user_id => user.id
    )
    2.times do 
        file = URI.open('https://res.cloudinary.com/dvzul9adr/image/upload/v1577198376/IMG_0487_dzprsi.jpg')
        property.images.attach(io: file, filename: 'IMG_0487_dzprsi.jpg', content_type: 'image/jpg')
    end
end


puts 'Finished!'