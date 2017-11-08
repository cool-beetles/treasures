class Treasure

  attr_reader :id, :storage, :special_note, :trashed
  attr_accessor :type, :title, :description, :owner

  def initialize(owner, type, title, description)
    @id = Random.rand(1000..20000)
  
    @owner = owner
    owner.treasures << self unless owner.treasures.include?(self)

    @type = type
    type.treasures << self unless type.treasures.include?(self)

    @title = title
    @description = description
    @trashed = false

    TreasuresCollection.add(self)
  end

  def rentals 
    RentalsCollection.by_treasure(self)
  end

  def add_storage(storage)
    @storage = storage
    storage.treasures << self unless storage.treasures.include?(self)
  end

  def add_special_note(note)
    @special_note = note
  end

  def move_to_trash
    @trashed = true
  end

  def add_rental(user, due_date)
    rental = Rental.new(user, self, due_date)
  end
end
