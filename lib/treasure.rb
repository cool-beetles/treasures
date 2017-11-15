class Treasure

  attr_reader :id, :storage, :special_note, :trashed
  attr_accessor :type, :title, :description, :owner

  def initialize(id = Random.rand(1000..20000), owner, type, title, description)
    @id = id
    @owner = owner
    @type = type
    @title = title
    @description = description
    @trashed = false

    TreasuresCollection.add(self)
  end

  def rentals 
    RentalsCollection.by_treasure(self)
  end

  def add_storage(storage)
    @storage.treasures = self
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
