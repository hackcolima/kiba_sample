# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

100.times do
  product = Product.create(name: Faker::Commerce.product_name)
  3.times do
    cost = Faker::Commerce.price
    name = [Faker::Commerce.material, Faker::Commerce.color].join(' ')
    Variant.create(name: name, product: product, cost: cost, price: cost * 1.13)
  end
end

puts "#{Product.count} products generated"

100.times do
  order = Order.create(customer_name: Faker::Name.name)
  3.times do
    offset = rand(Variant.count)
    variant = Variant.offset(offset).first
    OrderItem.create(order: order, variant: variant, price: variant.price)
  end
end
puts "#{Order.count} orders generated"
