# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.create({ name: 'Waffles', age: 2, gender: 'm', breed: 'tabby', color: 'orange', personality: 'friendly'})
Cat.create({ name: 'Rosie', age: 4, gender: 'f', breed: 'tabby', color: 'grey', personality: 'curious'})
Cat.create({ name: 'Fluffles', age: 9, gender: 'f', breed: 'long-haired', color: 'white', personality: 'lazy'})

Cafe.create({ name: 'So Nicé Café'})
