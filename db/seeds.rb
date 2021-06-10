# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Stock.create(ticker: "GOOG", name: "Alphabet Inc", last_price: 2504.39)
Stock.create(ticker: "AAPL", name: "Apple Inc", last_price: 129.48)
Stock.create(ticker: "MSFT", name: "Microsoft Corporation", last_price: 256.09)
Stock.create(ticker: "TSLA", name: "Tesla Inc", last_price: 621.5)


u = User.new(email: "guillaume@example.com", password: "guillaume")
u.save(validate: false)
u = User.new(email: "john@example.com", password: "john")
u.save(validate: false)
u = User.new(email: "joe@example.com", password: "joe")
u.save(validate: false)
u = User.new(email: "squall@example.com", password: "squall")
u.save(validate: false)