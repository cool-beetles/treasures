class AddressesCollection
    @@addresses = []

  def self.add(address)
    @@addresses << address
  end

  def self.all
    @@addresses
  end
  
  def self.find_by_id(id)
    @@addresses.detect { |address| address.id == id }    
  end

  def self.by_storage(storage)
    @@addresses.select { |address| address.storage.id == storage.id }
  end
  
  def self.by_user(user)
    @@addresses.select { |address| address.user.id == user.id }
  end

  def self.save
    @@addresses.each { |address| 
      file = File.new("../lib/collections/addresses_files/#{address.id}.address","w")
      file.puts("#{address.id}||#{address.street}||#{address.city}||#{address.zip_code}")
      file.close
    }
  end

  def self.load(file_name)
    require 'pathname'
    self.add(Dir.glob("#{file_name}/*.address"))
  end

  def self.load(file_name)
    require 'pathname'
    Dir["#{file_name}/*.address"].each do |address_file_path|
      address_file = File.open(address_file_path)
      address_array = address_file.read.split("||")
      address = Address.new(address_array[0], address_array[1], address_array[2], address_array[3])
    end
  end
end
