class User

  attr_reader :treasures, :rentals, :addresses, :owner, :id, :type, :title, :description
  attr_accessor :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @id = rand(1..1000)
    @first_name = first_name
    @last_name = last_name    
    @age = age
    @addresses = []
    @treasures = []
    @rentals = []
  end

  def add_treasure(type, title, description)
    treasure = Treasure.new(self, type, title, description)
    @treasures << treasure
  end

  def add_rental(treasure, due_date)
    rental = Rental.new(self, treasure, due_date)
    @rentals << rental
  end

  def add_address(address)
    @addresses.push(address)
    address = self
  end
end
