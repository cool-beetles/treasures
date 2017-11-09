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

  def self.save
    @@storages.each { |storage| 
      file = File.new("../lib/collections/storages_files/#{storage.id}.storage","w")
      file.puts("#{storage.id}||#{storage.name}")
      file.close
    }
  end

  def self.load(file_name)
    require 'pathname'
    self.add(Dir.glob("#{file_name}/*.storage"))
  end
end
