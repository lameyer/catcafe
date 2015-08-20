# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.find_or_create_by({ name: 'Waffles', age: 2, gender: 'm', breed: 'tabby', color: 'orange', personality: 'friendly'})
Cat.find_or_create_by({ name: 'Rosie', age: 4, gender: 'f', breed: 'tabby', color: 'grey', personality: 'curious'})
Cat.find_or_create_by({ name: 'Fluffles', age: 9, gender: 'f', breed: 'long-haired', color: 'white', personality: 'lazy'})

Cafe.find_or_create_by({ name: 'So Nicé Café'})

Item.find_or_create_by({ name: "Coffee", purchase_price: 1000, visit_price: 300, min_visit_duration: 5, max_visit_duration: 20})
Item.find_or_create_by({ name: "Croissant", purchase_price: 5000, visit_price: 400, min_visit_duration: 15, max_visit_duration: 30})
Item.find_or_create_by({ name: "Yarn Ball", purchase_price: 3000, visit_price: 300, min_visit_duration: 10, max_visit_duration: 25})
Item.find_or_create_by({ name: "Cat Nip", purchase_price: 800, visit_price: 50, min_visit_duration: 5, max_visit_duration: 15})


