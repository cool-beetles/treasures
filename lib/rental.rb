require 'date'

class Rental

  attr_reader :id, :due_date, :start_date, :return_date
  attr_accessor :user, :treasure

  def initialize(user, treasure, due_date)
    @id =  Random.rand(1000..20000)
    
    @user = user
    user.rentals << self unless user.rentals.include?(self) 

    @treasure = treasure
    treasure.rentals << self unless treasure.rentals.include?(self)

    @start_date = Date.today
    @due_date = due_date

    RentalsCollection.add(self)
  end

  def change_due_date(new_date)
    @due_date = new_date
  end

  def return
    @return_date = Date.today
  end
end
