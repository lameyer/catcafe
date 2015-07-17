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

Item.find_or_create_by({ name: "Red Ball"})
Item.find_or_create_by({ name: "Carboard Box"})
Item.find_or_create_by({ name: "Cat Nip"})
Item.find_or_create_by({ name: "Old Slipper"})
Item.find_or_create_by({ name: "Mouse"})
Item.find_or_create_by({ name: "Feather Tassle"})
