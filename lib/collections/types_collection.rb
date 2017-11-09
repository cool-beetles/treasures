class TypesCollection
  @@types = []

  def self.add(type)
    @@types << type
  end

  def self.all
    @@types
  end
  
  def self.find_by_id(id)
    @@types.detect { |type| type.id == id }    
  end

  def self.save
    @@types.each { |type| 
      file = File.new("../lib/collections/types_files/#{type.id}.type","w")
      file.puts("#{type.id}||#{type.name}")
      file.close
    }
  end

  def self.load(file_name)
    require 'pathname'
    self.add(Dir.glob("#{file_name}/*.type"))
  end
end
