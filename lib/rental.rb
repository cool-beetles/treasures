class Rental

  attr_reader :id, :due_date, :start_date, :return_date
  attr_accessor :user, :treasure

  def initialize(user, treasure, due_date)
    @id = id
    
    @user = user
    user.rentals << self

    @treasure = treasure
    @start_date = Time.at(Time.now.to_i)
    @due_date = due_date
    @return_date = []
  end

  def change_due_date=(new_date)
    @due_date = new_date
  end

  def return
    @return_date << (Time.at(Time.now.to_i))
    (Time.at(Time.now.to_i)).rental = self
  end
end
