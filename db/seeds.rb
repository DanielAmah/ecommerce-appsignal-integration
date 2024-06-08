# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
LineItem.destroy_all
Order.destroy_all
User.destroy_all
Product.destroy_all



50.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email)

  50.times do
    product = Product.create(name: Faker::Commerce.product_name, price: Faker::Commerce.price)

    order = Order.create!(
      user: user,
      product: product,
      status: 'pending',
      total: 0
    )

    quantity = rand(1..5)

    line_item = LineItem.create!(
      order: order,
      product: product,
      quantity: quantity,
      price: product.price
    )
    order.total += line_item.price * line_item.quantity
    order.update!(total: order.total)
  end
end
