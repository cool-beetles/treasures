class User

  attr_reader :id
  attr_accessor :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @id = Random.rand(1000..20000)
    @first_name = first_name
    @last_name = last_name    
    @age = age

    UsersCollection.add(self)
  end
  
  def addresses
    AddressesCollection.by_user(self)
  end

  def rentals 
    RentalsCollection.by_user(self)
  end
  
  def treasures
    TreasuresCollection.by_user(self)
  end

  def add_treasure(type, title, description)
    treasure = Treasure.new(self, type, title, description)
    treasure.owner = self
  end

  def add_rental(treasure, due_date)
    rental = Rental.new(self, treasure, due_date)
  end

  def add_address(address)
    address.add_object(self)
  end
end
