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
      file.puts("#{rental.id}||#{rental.user.first_name}||#{rental.treasure.title}||#{rental.treasure.id}||#{rental.due_date}")
      file.close
    }
  end
end
