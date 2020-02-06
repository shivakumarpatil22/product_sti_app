# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
  Pen.create(name: "pen#{i}",price: "#{i*12}",inward_date: Date.today,color: "red")
  Notebook.create(name: "notebook#{i}",price: "#{i*14}",inward_date: (Date.today-1.day),color: "Blue")
  Product.create(name: "product#{i}",price: "#{i*15}",inward_date: (Date.today+2.day),color: "Green")
end