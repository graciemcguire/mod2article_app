# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = [
  {name: "sports"},
  {name: "politics"},
  {name: "fashion"},
  {name: "art"},
  {name: "food"},
  {name: "travel"},
  {name: "entertainment"},
  {name: "health"},
  {name: "tech"},
  {name: "business"}
]

categories.each {|category| Category.create(category)}

users = [
  {name: "gracie", username: "gracie" , password: "password", category1: "sports", category2: "tech", category3: "business"}
]

users.each {|user| User.create(user)}
