class Address

  attr_reader :id, :object, :object_klass
  attr_accessor :street, :city, :zip_code

  def initialize(id = Random.rand(1000..20000), street, city, zip_code)
    @id = id
    @street = street
    @city = city
    @zip_code = zip_code

    AddressesCollection.add(self)
  end
  
  def add_object(object)
    @object = object
    @object_klass = object.class.name
  end
end
