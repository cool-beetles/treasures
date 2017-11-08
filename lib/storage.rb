class Storage

  attr_reader :treasures, :addresses, :id
  attr_accessor :name

  def initialize(name)
    @id =   Random.rand(1000..20000)
    @name = name
    @addresses = []
    @treasures = []
  end

  def add_treasure(treasure)
    @treasures << treasure unless @treasures.include?(treasure)
    treasure.storage = self
  end

  def add_address(address)
    @addresses << address unless @addresses.include?(address)
    address.add_object(self)
  end
end
