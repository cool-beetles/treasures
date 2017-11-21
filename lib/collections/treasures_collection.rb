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

      storage_id = treasure.storage ? treasure.storage.id : nil

      file.puts("#{treasure.id}||#{treasure.owner.id}||#{treasure.type.id}||#{treasure.title}" + 
        "||#{treasure.description}||#{treasure.trashed}||#{storage_id}||#{treasure.special_note}")
      file.close
    }
  end

  def self.load(file_name)
    require 'pathname'
    Dir["#{file_name}/*.treasure"].each do |treasure_file_path|
      treasure_file = File.open(treasure_file_path)
      treasure_array = treasure_file.read.split("||")

      owner_id = treasure_array[1]
      owner = UsersCollection.find_by_id(owner_id)

      type_id = treasure_array[2]
      type = TypesCollection.find_by_id(type_id)

      storage_id = treasure_array[6]
      storage = StoragesCollection.find_by_id(storage_id)

      treasure_id = treasure_array[0]
      treasure_title = treasure_array[3]
      treasure_description = treasure_array[4]
      treasure = Treasure.new(treasure_id, owner, type, treasure_title, treasure_description)

      special_note = treasure_array[7]
      treasure.add_special_note(special_note)
    end
  end
end
