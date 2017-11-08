class TreasuresCollection
  @@treasures = []

  def self.add(treasure)
    @@treasures << treasure
  end

  def self.all
    @@treasures
  end

  def self.find_by_id(id)
    @@treasures.detect { |treasure| treasure.id == id }
  end

  def self.by_user(user)
    @@treasures.select { |treasure| treasure.owner.id == user.id }
  end

  def self.by_type(type)
    @@treasures.select { |treasure| treasure.type.id == type.id }
  end

  def self.by_storage(storage)
    @@treasures.select { |treasure| treasure.storage.id == storage.id }
  end
end
