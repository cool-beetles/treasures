#!/usr/bin/env ruby

require '../lib/address.rb'
require '../lib/rental.rb'
require '../lib/storage.rb'
require '../lib/treasure.rb'
require '../lib/type.rb'
require '../lib/user.rb'
require '../lib/collections/addresses_collection.rb'
require '../lib/collections/treasures_collection.rb'
require '../lib/collections/rentals_collection.rb'
require '../lib/collections/types_collection.rb'
require '../lib/collections/storages_collection.rb'
require '../lib/collections/users_collection.rb'

puts "user:"
puts "your name"
first_name = gets.chomp
puts "your surname"
last_name = gets.chomp
puts "your age"
age = gets.chomp
user_1 = User.new(first_name, last_name, age)
puts "your id: #{user_1.id}"

puts "address:"
puts "city"
city = gets.chomp
puts "street"
street = gets.chomp
puts "zip code"
zip_code = gets.chomp
address = Address.new(street, city, zip_code)
puts "address it's storage"
puts "storage name"
storage_name = gets.chomp
storage = Storage.new(storage_name)
user_1.add_address(address)
storage.add_address(address)

puts "type of treasure"
puts "type's name"
type_name = gets.chomp
type = Type.new(type_name)
puts "id: #{type.id}"

puts "add treasures"
more_tresures = true

while more_tresures do
  puts "title"
  title = gets.chomp
  puts "description"
  description = gets.chomp
  user_1.add_treasure(type, title, description)
  puts "Wanna add more? (y/n)"
  more_tresures = gets.chomp == "y"
end

puts "Ok, here is a number of your treasuares: #{user_1.treasures.count}"

puts "list of treasures:"
puts user_1.treasures.map { |treasure| treasure.title }
puts "-----------------------"

puts "friend's name"
friends_name = gets.chomp
puts "friend's surname"
friends_surname = gets.chomp
puts "friend's age"
friends_age = gets.chomp
friend = User.new(friends_name, friends_surname, friends_age)
puts "friend's city"
friends_city = gets.chomp
puts "friend's street"
friends_street = gets.chomp
puts "friend's zip code"
friends_zip_code = gets.chomp
friends_address = Address.new(friends_street, friends_city, friends_zip_code)
friend.add_address(friends_address)

puts "rental"
puts "Here is a list of your treasures with their ids, titles and descriptions:"
user_1.treasures.each do |treasure| 
  puts "#{treasure.id} #{treasure.title} #{treasure.description}"
end

puts "treasure id"
treasure_id = gets.chomp
puts "Until (YYYY-MM-DD):"
due_date = gets.chomp
Date.parse(due_date)

selected_treasure = user_1.treasures.detect { |treasure| treasure.id == treasure_id.to_i }
friend.add_rental(selected_treasure, due_date)

puts "Done! #{friend.rentals.last.user.first_name} needs to return #{friend.rentals.last.treasure.title} before #{due_date}."

TreasuresCollection.save
UsersCollection.save
AddressesCollection.save
StoragesCollection.save
TypesCollection.save
RentalsCollection.save

# UsersCollection.load("../lib/collections/users_files")
# StoragesCollection.load("../lib/collections/storages_files")
# TypesCollection.load("../lib/collections/types_files")
# TreasuresCollection.load("../lib/collections/treasures_files")
# RentalsCollection.load("../lib/collections/rentals_files")
# AddressesCollection.load("../lib/collections/addresses_files")
