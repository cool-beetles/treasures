class Storage

  attr_reader :treasures, :addresses, :id
  attr_accessor :name

  def initialize(name)
    @id = id
    @name = name
    @addresses = []
  end

  def add_treasure(treasure)
    @treasures << treasure
    treasure.storage = self
  end

  def add_address(address)
    @addresses << address
    address.storage = self
  end
end
