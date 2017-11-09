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

  def self.save
    @@treasures.each { |treasure| 
      file = File.new("../lib/collections/treasures_files/#{treasure.id}.treasure","w")
      file.puts("#{treasure.id}||#{treasure.owner.first_name}||#{treasure.type}||#{treasure.title}||#{treasure.description}||#{treasure.trashed}||#{treasure.storage}||#{treasure.special_note}")
      file.close
    }
  end
end
