class Type

  attr_reader :id
  attr_accessor :name

  def initialize(name)
    @name = name
    @id = Random.rand(1000..20000)
  end

  def treasures
    TreasuresCollection.by_type(self)
  end

  def add_treasure(treasure)
    treasure.type = self
  end
end
