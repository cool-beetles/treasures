class Address

  attr_reader :id
  attr_accessor :street, :city, :zip_code

  def initialize(street, city, zip_code)
    @id = id
    @street = street
    @city = city
    @zip_code = zip_code
  end
end
