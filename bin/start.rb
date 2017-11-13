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
puts TreasuresCollection.load("../lib/collections/treasures_files")
AddressesCollection.load("../lib/collections/addresses_files")
RentalsCollection.load("../lib/collections/rentals_files")
StoragesCollection.load("../lib/collections/storages_files")
TypesCollection.load("../lib/collections/types_files")

puts UsersCollection.all.first.treasures
# TreasuresCollection.save
# AddressesCollection.save
# RentalsCollection.save
# StoragesCollection.save
# TypesCollection.save
# UsersCollection.save
