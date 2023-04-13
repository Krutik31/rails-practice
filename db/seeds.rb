# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Author.all.each do |author|
#   5.times do |i|
#     author.books.find_or_create_by(name: "Book#{i + 10} by #{author.first_name}", price: 650)
#   end
# end

# users = %w[admin krutik dhyey nil]
# lastname = %w[admin patel sapara patel]
# phonenumber = %w[1111122222 3333344444 5555566666 7777788888]
# category = %w[Music Celebration Film Fashion]

# 4.times do |i|
#   User.find_or_create_by(id: i + 1, username: users[i], password: '123')
#   Profile.find_or_create_by(firstname: users[i], lastname: lastname[i], phonenumber: phonenumber[i], user_id: i + 1)
#   Address.find_or_create_by(address_line1: 'address_line1', address_line2: 'address_line2', city: 'Ahmedabad',
#                             pincode: '383001', user_id: i + 1)
#   Category.find_or_create_by(category_name: category[i])
# end

10.times do |item|
  Item.find_or_create_by(id: item + 1, title: "Product #{item}", description: "Product Description #{item}",
                         price: item * 1000, capacity: item * 10, is_active: rand(0..1), product_status: rand(0..2))
end

10.times do |cust|
  Customer.find_or_create_by(id: cust + 1, first_name: "John#{cust}", last_name: "Doe#{cust}",
                             email: "john#{cust}@gmail.com", phone_number: "940980050#{cust}")
end

20.times do |ord|
  itemid = Item.all.to_a.sample.id
  Order.find_or_create_by(id: ord + 1, quantity: rand(1..25), order_status: %w[booked cancelled].sample,
                          item_id: itemid, customer_id: rand(1..10))
end
