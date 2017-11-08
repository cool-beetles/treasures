class Type

  attr_reader :treasures, :id
  attr_accessor :name

  def initialize(name)
    @name = name
    @id = Random.rand(1000..20000)
    @treasures = []
  end

  def add_treasure(treasure)
    @treasures << treasure unless @treasures.include?(treasure)
    treasure.type = self
  end
end
