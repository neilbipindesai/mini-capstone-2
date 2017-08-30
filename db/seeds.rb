# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
product = Product.new(name:"Parliament", price: 11, image:"https://i.ebayimg.com/thumbs/images/g/-icAAOSwGotWiyh1/s-l225.jpg", description: "is a brand of cigarettes marketed by the company Philip Morris. ... In the 1940s and 1950s, the brand was marketed for its unique filters")

product.save

product = Product.new(name:"Kool", price: 9, image:"http://www.cheap-menthol-cigarettes.com/img/kool-menthol-ks.jpg", description: "is a brand of ciggerattes that are cheaper in price and mostly smoked by people of African-American decent")

product.save

product = Product.new(name:"Marlboro Lights", price: 12, image:"http://www.classactionsreporter.com/sites/default/files/images/settlements/marlboro_lights.jpg", description: "is the light version of the Marlboro Reds and they are a lot sexier then the Reds")

product.save