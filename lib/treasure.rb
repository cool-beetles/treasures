class Treasure

  attr_reader :rentals, :id, :storage, :special_note, :trashed, :owner
  attr_accessor :type, :title, :description

  def initialize(owner, type, title, description)
    @id = rand(1..1000)
    @owner = owner
    @type = type    
    @title = title
    @description = description
    @storage = storage    
    @trashed = trashed
    @special_note = special_note
    @rentals = [] 
  end

  def add_storage(storage_id)
    @storage = storage_id
    storage_id.treasure = self
  end

  def add_special_note(note)
    @special_note = note
    note.treasure = self
  end

  def move_to_trash
    @trashed = true
  end

  def add_rental(user, due_date)
    @user = user
    user.rentals << self

    @due_date = due_date
    due_date.rentals << self
  end
end
