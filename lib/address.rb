class Address

  attr_reader :id
  attr_accessor :street, :city, :zip_code

  def initialize(street, city, zip_code)
    @id =  Random.rand(1000..20000)
    @street = street
    @city = city
    @zip_code = zip_code
  end

  def add_obcject(object)
    @object = object
    @object_klass = object.class.name
  end
end
