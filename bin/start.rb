#!/usr/bin/env ruby

require '../lib/address.rb'
require '../lib/rental.rb'
require '../lib/storage.rb'
require '../lib/treasure.rb'
require '../lib/type.rb'
require '../lib/user.rb'


puts "Welcome to your treasures managment"
puts "-----------------------"
puts "First, tell me who you are, so I can prepare your account."
puts "Could you give me your name, please?"
first_name = gets.chomp
puts "Could you give me your surname, please?"
last_name = gets.chomp
puts "Could you give me your age, please?"
age = gets.chomp
user_1 = User.new(first_name, last_name, age)
puts "Excellent! I created a user for you! This is your id: #{user_1.id}"
puts "-----------------------"

puts "Hi #{user_1.first_name}, wanna add your address?"
puts "Could you give me the city, please?"
city = gets.chomp
puts "Could you give me the street, please?"
street = gets.chomp
puts "Could you give me the zip code, please?"
zip_code = gets.chomp
address = Address.new(street, city, zip_code)
user_1.add_address(street)

puts "Address was added to you!"
puts "You live in #{address.street} #{address.city} #{address.zip_code}"
puts "-----------------------"


puts "Now, tell me something about your treasures..."
puts "Which type of treasure do you own?"

puts "Could you give type's name, please?"
name = gets.chomp
name = Type.new(name)
puts "Excellent! I created a type for you! This is it's id: #{name.id}"
puts "-----------------------"


puts "Time to add some treasures!"
more_tresures = true

while more_tresures do
  puts "Could you give me the title of your treasure, please?"
  title = gets.chomp
  puts "Could you give me the description of your treasure, please?"
  description = gets.chomp
  type = name.name
  puts "It's created!"
  user_1.add_treasure(type, title, description)
  puts "Wanna add more? (y/n)"
  more_tresures = gets.chomp == "y"
end

puts "Ok, here is a number of your treasuares: #{user_1.treasures.count}"

puts "And a list of title for all your treasures:"
user_1.treasures.each { |treasure| puts "#{treasure.title}" }
puts "-----------------------"

puts "Now, if you save your friend details, you will be able to rent them some of your treasures!"
puts "Could you give me your friend's name, please?"
friends_name = gets.chomp
puts "Could you give me your friend's surname, please?"
friends_surname = gets.chomp
puts "Could you give me your friend's age, please?"
friends_age = gets.chomp
friend = User.new(friends_name, friends_surname, friends_age)
puts "Could you give me your friend's city, please?"
friends_city = gets.chomp
puts "Could you give me your friend's street, please?"
friends_street = gets.chomp
puts "Could you give me your friend's zip code, please?"
friends_zip_code = gets.chomp
friends_address = Address.new(friends_street, friends_city, friends_zip_code)


puts "Awesome!"
puts "-----------------------"

puts "Now let's rent something!"
puts "Here is a list of your treasures with their ids, titles and descriptions:"
user_1.treasures.each do |treasure| 
  puts "#{treasure.id}" + " " + "#{treasure.title}" + " " + "#{treasure.description}"
end

puts "So, which treasure would you like to rent? Give an id, please:"
treasure_id = gets.chomp

puts "Until which date? (YYYY-MM-DD):"
due_date = gets.chomp
friend.add_rental(treasure_id, due_date)
friend.rentals.each do |rental|
  puts "Done! <#{rental.user.first_name}> needs to return <#{rental.treasure}> before <#{rental.due_date}>."
end

puts "That's enough for now. Remember to come back later!"
