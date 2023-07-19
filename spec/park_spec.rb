require './lib/vehicle'
require './lib/passenger'
require './lib/park'

RSpec.describe Park do
  before(:each) do
    @zion = Park.new({name: "Zion", admission_price: 20})
    @vehicle = Vehicle.new("2001", "Honda", "Civic")
    @charlie = Passenger.new({name: "Charlie", age: 18})
    @jude = Passenger.new({name: "Jude", age: 20})  
    @taylor = Passenger.new({name: "Taylor", age: 12})  
  end

  it "exists" do
    expect(@zion).to be_instance_of(Park)
  end

end