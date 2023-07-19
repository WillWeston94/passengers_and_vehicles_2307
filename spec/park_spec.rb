require './lib/vehicle'
require './lib/passenger'
require './lib/park'

RSpec.describe Park do
  before(:each) do
    @zion = Park.new({unique_name: "Zion", admission_price: 20})
    @vehicle = Vehicle.new("2001", "Honda", "Civic")
    @charlie = Passenger.new({name: "Charlie", age: 18})
    @jude = Passenger.new({name: "Jude", age: 20})  
    @taylor = Passenger.new({name: "Taylor", age: 12})  
  end

  it "exists" do
    expect(@zion).to be_instance_of(Park)
  end

  it 'shows vehicles entering park' do
    expect(@zion.vehicles_entered).to eq([])
  end

  it 'adds vehicles to park' do
    @zion.add_vehicle(@vehicle)

    expect(@zion.vehicles_entered).to eq([@vehicle])
    expect(@zion.vehicles_entered.count).to eq(1)
  end

  it 'lists passengers in entered vehicle' do
    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@jude)
    @vehicle.add_passenger(@taylor)
    @zion.add_vehicle(@vehicle)

    expect(@zion.list_passengers).to eq([@charlie, @jude, @taylor])
  end
end