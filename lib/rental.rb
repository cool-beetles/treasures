require 'date'

class Rental

  attr_reader :id, :due_date, :start_date, :return_date
  attr_accessor :user, :treasure

  def initialize(id=Random.rand(1000..20000), user, treasure, due_date)
    @id =  id
    @user = user
    @treasure = treasure
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
