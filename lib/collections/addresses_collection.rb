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

      object_id = address.object ? address.object.id : nil

        file.puts("#{address.id}||#{address.street}||#{address.city}||#{address.zip_code}||#{object_id}" +
          "||#{address.object_klass}")
      file.close
    }
  end

  def self.load(file_name)
    require 'pathname'
    Dir["#{file_name}/*.address"].each do |address_file_path|
      address_file = File.open(address_file_path)
      address_array = address_file.read.strip.split("||")

      address_id = address_array[0].to_i
      street = address_array[1]
      city = address_array[2]
      zip_code = address_array[3]
      address = Address.new(address_id, street, city, zip_code)

      object_id = address_array[4].to_i
      object_klass = address_array[5]

      if object_klass.downcase == "user"
        object = UsersCollection.find_by_id(object_id)
      elsif object_klass.downcase == "storage"
        object = StoragesCollection.find_by_id(object_id)
      end

      address.add_object(object)
    end
  end
end
