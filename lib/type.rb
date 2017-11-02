class Type

  attr_reader :treasures, :id
  attr_accessor :name

  def initialize(name)
    @name = name
    @id = rand(1000..2000)
    @treasures = []
  end

  def add_treasure(treasure)
    @treasures << treasure
    treasure.type = self
  end
end
