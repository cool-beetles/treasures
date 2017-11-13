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

  def self.by_type_name(name)
    @@treasures.select { |treasure| treasure.type.name == type.name }
  end

  def self.by_storage(storage)
    @@treasures.select { |treasure| treasure.storage.id == storage.id }
  end

  def self.save
    @@treasures.each { |treasure| 
      file = File.new("../lib/collections/treasures_files/#{treasure.id}.treasure","w")
      file.puts("#{treasure.id}||#{treasure.owner.id}||#{treasure.type.name}||#{treasure.title}||#{treasure.description}||#{treasure.trashed}||#{treasure.storage.id}||#{treasure.storage.name}||#{treasure.special_note}")
      file.close
    }
  end

  def self.load(file_name)
    require 'pathname'
    Dir["#{file_name}/*.treasure"].each do |treasure_file_path|
      treasure_file = File.open(treasure_file_path)
      treasure_array = treasure_file.read.split("||")
      owner = UsersCollection.find_by_id(treasure_array[1])    
      treasure = Treasure.new(treasure_array[0], owner, treasure_array[2], treasure_array[3], treasure_array[4])
    end
  end
end
