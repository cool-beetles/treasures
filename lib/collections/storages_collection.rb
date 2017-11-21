class StoragesCollection
  @@storages = []

  def self.add(storage)
    @@storages << storage
  end

  def self.all
    @@storages
  end
  
  def self.find_by_id(id)
    @@storages.detect { |storage| storage.id == id }    
  end

  def self.by_name(name)
    @@storages.select { |storage| storage.name == name }    
  end

  def self.save
    @@storages.each { |storage| 
      file = File.new("../lib/collections/storages_files/#{storage.id}.storage","w")
      file.puts("#{storage.id}||#{storage.name}")
      file.close
    }
  end

  def self.load(file_name)
    require 'pathname'
    Dir["#{file_name}/*.storage"].each do |storage_file_path|
      storage_file = File.open(storage_file_path)
      storage_array = storage_file.read.split("||")

      storage_id = storage_array[0]
      storage_name = storage_array[1]
      storage = Storage.new(storage_id, storage_name)
    end
  end
end
