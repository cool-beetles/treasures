class User

  attr_reader :treasures, :rentals, :addresses, :id
  attr_accessor :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @id = Random.rand(1000..20000)
    @first_name = first_name
    @last_name = last_name    
    @age = age
    @addresses = []
    @treasures = []
    @rentals = []
  end

  def add_treasure(type, title, description)
    treasure = Treasure.new(self, type, title, description)
    @treasures << treasure unless @treasures.include?(treasure)
  end

  def add_rental(treasure, due_date)
    rental = Rental.new(self, treasure, due_date)
  end

  def add_address(address)
    @addresses << address unless @addresses.include?(address)
    address.add_object(self)
  end
end
