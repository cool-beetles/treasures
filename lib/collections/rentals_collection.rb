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
      file.puts("#{rental.id}||#{rental.user.id}||#{rental.treasure.id}||#{rental.treasure.owner.id}||" +
        "#{rental.due_date}")
      file.close
    }
  end

  def self.load(file_name)
    require 'pathname'
    Dir["#{file_name}/*.rental"].each do |rental_file_path|
      rental_file = File.open(rental_file_path)
      rental_array = rental_file.read.split("||")
    
      user_id = rental_array[1]
      user = UsersCollection.find_by_id(user_id)
    
      owner_id = rental_array[6]
      owner = UsersCollection.find_by_id(owner_id)

      treasure_id = rental_array[5]      
      treasure = TreasuresCollection.find_by_id(treasure_id)
      
      rental_id = rental_array[0]
      due_date = rental_array[13]
      rental = Rental.new(rental_id, user, treasure, due_date)
    end
  end
end
