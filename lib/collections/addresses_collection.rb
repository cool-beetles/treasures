class AddressesCollection
    @@addresses = []

  def self.add(address)
    @@addresses << address
  end

  def self.all
    @@addresses
  end

  def self.by_storage(storage)
    @@addresses.select { |address| address.storage.id == storage.id }
  end
  
  def self.by_user(user)
    @@addresses.select { |address| address.user.id == user.id }
  end
end
