class Storage

  attr_reader :id
  attr_accessor :name

  def initialize(name)
    @id =   Random.rand(1000..20000)
    @name = name

    StoragesCollection.add(self)
  end

  def addresses
    AddressesCollection.by_storage(self)
  end

  def treasures
    TreasuresCollection.by_storage(self)
  end

  def add_treasure(treasure)
    treasure.storage = self
  end

  def add_address(address)
    address.add_object(self)
  end
end
