class Passenger
  attr_reader :name,
              :age

  def initialize(attributes)
    @name = attributes[:name]
    @age = attributes[:age]
  end
  
  def adult?
    if @age >= 18 
      true
    else
      false
    end
  end
end