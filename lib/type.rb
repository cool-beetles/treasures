class Type

  attr_reader :id
  attr_accessor :name

  def initialize(id=Random.rand(1000..20000), name)
    @name = name
    @id = id

    TypesCollection.add(self)
  end

  def treasures
    TreasuresCollection.by_type(self)
  end

  def add_treasure(treasure)
    treasure.type = self
  end
end
