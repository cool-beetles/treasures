class RentalsCollection
  @@rentals = []

  def self.add(rental)
    @@rentals << rental
  end

  def self.all
    @@rentals
  end

  def self.find_by_id(id)
    @@rentals.detect { |rental| rental.id == id }    
  end

  def self.by_user(user)
    @@rentals.select { |rental| rental.user.id == user.id }
  end

  def self.by_treasure(treasure)
    @@rentals.select { |rental| rental.treasure.id == treasure.id }
  end

  def self.save
    @@rentals.each { |rental| 
      file = File.new("../lib/collections/rentals_files/#{rental.id}.rental","w")
      file.puts("#{rental.id}||#{rental.user.id}||#{rental.user.first_name}||#{rental.user.last_name}||#{rental.user.age}||#{rental.treasure.id}||#{rental.treasure.owner.id}||#{rental.treasure.owner.first_name}||#{rental.treasure.owner.last_name}||#{rental.treasure.owner.age}||||#{rental.treasure.type}||#{rental.treasure.title}#{rental.treasure.description}||#{rental.due_date}")
      file.close
    }
  end

  def self.load(file_name)
    require 'pathname'
    Dir["#{file_name}/*.rental"].each do |rental_file_path|
      rental_file = File.open(rental_file_path)
      rental_array = rental_file.read.split("||")
    
      user_id = rental_array[1]
      user_first_name = rental_array[2]
      user_last_name = rental_array[3]
      user_age = rental_array[4]
      user = User.new(user_id, user_first_name, user_last_name, user_age)

      owner_id = rental_array[6]
      owner_first_name = rental_array[7]
      owner_last_name = rental_array[8]
      owner_age = rental_array[9]
      owner = User.new(owner_id, owner_first_name, owner_last_name, owner_age)

      treasure_id = rental_array[5]      
      treasure_type = rental_array[10]
      treasure_title = rental_array[11]
      treasure_description = rental_array[12]
      treasure = Treasure.new(treasure_id, owner, treasure_type, treasure_title, treasure_description)

      rental_id = rental_array[0]
      due_date = rental_array[13]
      rental = Rental.new(rental_id, user, treasure, due_date)
    end
  end
end
