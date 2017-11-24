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

UsersCollection.load("../lib/collections/users_files")
StoragesCollection.load("../lib/collections/storages_files")
TypesCollection.load("../lib/collections/types_files")
TreasuresCollection.load("../lib/collections/treasures_files")
RentalsCollection.load("../lib/collections/rentals_files")
AddressesCollection.load("../lib/collections/addresses_files")

puts "Loaded files:"
puts "Users: #{UsersCollection.all.count}"
puts "Storages: #{StoragesCollection.all.count}"
puts "Types: #{TypesCollection.all.count}"
puts "Treasures: #{TreasuresCollection.all.count}"
puts "Rentals: #{RentalsCollection.all.count}"
puts "Adresses: #{AddressesCollection.all.count}"
puts "-----------------------------------------"


puts "Users list:"
UsersCollection.all.map do |user| 
  puts "#{user.id} #{user.first_name} #{user.last_name}"
end

puts "-----------------------------------------"
puts "Add user? (y/n)"
more_users = gets.chomp

while more_users == "y" do
  puts "Give me:"
  puts "name"
  first_name = gets.chomp
  puts "surname"
  last_name = gets.chomp
  puts "age"
  age = gets.chomp
  user = User.new(first_name, last_name, age)
  puts "Id for user: #{user.id}"
  puts "Now, address:"
  puts "city"
  city = gets.chomp
  puts "street"
  street = gets.chomp
  puts "zip code"
  zip_code = gets.chomp
  address = Address.new(street, city, zip_code)
  user.add_address(address)
  puts "Do You wanna add more users? (y/n)"
  more_users = gets.chomp
end
  
puts "-----------------------------------------"
puts "Give me Your id:"
user_id = gets.chomp.to_i
current_user = UsersCollection.find_by_id(user_id)
puts "-----------------------------------------"

puts "Your treasures:"
treasures = TreasuresCollection.by_user(current_user)
  if treasures.count == 0
  puts "You have no treasures"
  else
    treasures.each do |treasure|
      puts "#{treasure.id} #{treasure.title} #{treasure.description}"
    end
  end
puts "-----------------------------------------"

puts "Do You wanna add new treasures? (y/n)"
more_treasures = gets.chomp

while more_treasures == "y" do
  puts "Available type's:"
  TypesCollection.all.map do |type|
    puts "#{type.name}"
  end

  puts "Give me type name"
  type_name = gets.chomp
  types = TypesCollection.all.map(&:name)
  type_position = types.find_index(type_name)
  if types[type_position] == type_name
    type = TypesCollection.by_name(type_name)
  else
    type = Type.new(type_name)
  end

  puts "title"
  title = gets.chomp
  puts "description"
  description = gets.chomp
  current_user.add_treasure(type, title, description)
  puts "Do You wanna add more? (y/n)"
  more_treasures = gets.chomp
end

puts "-----------------------------------------"
puts "Now, Your list of treasures:"
treasures = TreasuresCollection.by_user(current_user)
treasures.each do |treasure|
  puts "id: #{treasure.id}, title: #{treasure.title}, description: #{treasure.description}"
end

puts "-----------------------------------------"
puts "Do You wanna add storage for Your treasures? (y/n)"
treasure_storage = gets.chomp

while treasure_storage == "y" do 
  puts "storage names:"
  StoragesCollection.all.map do |storage|
    puts "#{storage.name}"
  end 
  puts "Give me chosen storage name"
  storage_name = gets.chomp
  storages = StoragesCollection.all.map(&:name)
  storage_position = storages.find_index(storage_name)
  if storages[storage_position] == storage_name
    storage = StoragesCollection.by_name(storage_name)
  else
    storage = Storage.new(storage_name)
    puts "street"
    street = gets.chomp
    puts "city"
    city = gets.chomp
    puts "zip_code"
    zip_code = gets.chomp
    storage_address = Address.new(street, city, zip_code)
    storage.add_address(storage_address)
  end

  puts "List of treasures:"
  treasures = TreasuresCollection.by_user(current_user)
  treasures.each do |treasure|
  puts "id: #{treasure.id}, title: #{treasure.title}, description: #{treasure.description}"
  end

  puts "-----------------------------------------"
  puts "Give me treasure id"
  treasure_id = gets.chomp.to_i
  treasure = TreasuresCollection.find_by_id(treasure_id)
  treasure.add_storage(storage)
 
  puts "Do You wanna add more places? (y/n)"
  treasure_storage = gets.chomp
end

puts "-----------------------------------------"
puts "Rent some of Your treasures:"
  
puts "List of treasures:"
treasures = TreasuresCollection.by_user(current_user)
treasures.each do |treasure|
  puts "id: #{treasure.id}, title: #{treasure.title}, description: #{treasure.description}"
end
puts "-----------------------------------------"

puts "Give me treasure id"
treasure_id = gets.chomp.to_i
puts "Until (YYYY-MM-DD):"
due_date = gets.chomp
Date.parse(due_date)
puts "Available users:"
UsersCollection.all.map do |user| 
  puts "id: #{user.id}, name: #{user.first_name}, surname: #{user.last_name}"
end

puts "-----------------------------------------"
puts "Give me user id:"
user_id = gets.chomp.to_i
rental_user = UsersCollection.find_by_id(user_id)
selected_treasure = current_user.treasures.detect { |treasure| treasure.id == treasure_id }
rental_user.add_rental(selected_treasure, due_date)
puts "Done! #{rental_user.rentals.last.user.first_name} needs to return #{rental_user.rentals.last.treasure.title} before #{due_date}."
puts "-----------------------------------------"

TypesCollection.save
RentalsCollection.save
UsersCollection.save
AddressesCollection.save
StoragesCollection.save
TreasuresCollection.save

puts "When You come back, Your collection will be like this:"
puts "Users: #{UsersCollection.all.count}"
puts "Storages: #{StoragesCollection.all.count}"
puts "Types: #{TypesCollection.all.count}"
puts "Treasures: #{TreasuresCollection.all.count}"
puts "Rentals: #{RentalsCollection.all.count}"
puts "Adresses: #{AddressesCollection.all.count}"
puts "-----------------------------------------"
puts "Bye!"
