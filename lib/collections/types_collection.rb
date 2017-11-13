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

  def self.by_name(name)
    @@types.select { |type| type.name == name}    
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

  def self.load(file_name)
    require 'pathname'
    Dir["#{file_name}/*.type"].each do |type_file_path|
      type_file = File.open(type_file_path)
      type_array = type_file.read.split("||")
      type = Type.new(type_array[0], type_array[1])
    end
  end
end
