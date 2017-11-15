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
RentalsCollection.load("../lib/collections/rentals_files")
TypesCollection.load("../lib/collections/types_files")
TreasuresCollection.load("../lib/collections/treasures_files")
AddressesCollection.load("../lib/collections/addresses_files")
StoragesCollection.load("../lib/collections/storages_files")

puts TreasuresCollection.all.map(&:type)
puts UsersCollection.all.count

type = Type.new("name")
puts UsersCollection.all.map(&:id)
puts "Podaj swoje id:"
owner_id = gets.chomp
owner = UsersCollection.find_by_id(owner_id)
treasure_3 = Treasure.new(id = Random.rand(1000..20000), owner, type, "lalala", "nanana")
puts treasure_3.add_special_note("nanana nanana")
rental_2 = Rental.new(owner, treasure_3, "2019-01-03")
user.add_rental(treasure_3, "2019-01-03")
puts rental_2.id

storage = Storage.new("house")
puts storage.name
UsersCollection.save
AddressesCollection.save
StoragesCollection.save
TypesCollection.save
TreasuresCollection.save
RentalsCollection.save
