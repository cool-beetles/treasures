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
      file.puts("#{treasure.id}||#{treasure.owner.id}||#{treasure.owner.first_name}||#{treasure.owner.last_name}||#{treasure.owner.age}||#{treasure.type.id}||#{treasure.type.name}||#{treasure.title}||#{treasure.description}||#{treasure.trashed}||#{treasure.storage.id}||#{treasure.storage.name}||#{treasure.special_note}")
      file.close
    }
  end

  def self.load(file_name)
    require 'pathname'
    Dir["#{file_name}/*.treasure"].each do |treasure_file_path|
      treasure_file = File.open(treasure_file_path)
      treasure_array = treasure_file.read.split("||")

      owner_id = treasure_array[1]
      first_name = treasure_array[2]
      last_name = treasure_array[3]
      age = treasure_array[4]
      owner = User.new(owner_id, first_name, last_name, age)

      type_id = treasure_array[5]
      type_name = treasure_array[6]
      type = Type.new(type_id, type_name)

      storage_id = treasure_array[11]
      storage_name = treasure_array[12]
      storage = Storage.new(storage_id, storage_name)

      treasure_id = treasure_array[0]
      treasure_title = treasure_array[7]
      treasure_description = treasure_array[8]
      treasure = Treasure.new(treasure_id, owner, type, treasure_title, treasure_description)
    end
  end
end
