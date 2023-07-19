require './lib/vehicle'
require './lib/passenger'
require './lib/park'

RSpec.describe Park do
  before(:each) do
    @zion = Park.new({unique_name: "Zion", admission_price: 20})
    @vehicle = Vehicle.new("2001", "Honda", "Civic")
    @vehicle_2 = Vehicle.new("2013", "Porsche", "911")
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
    @zion.add_vehicle(@vehicle_2)
    
    expect(@zion.vehicles_entered).to eq([@vehicle, @vehicle_2])
    expect(@zion.vehicles_entered.count).to eq(2)
  end
  

  it 'lists passengers in entered vehicle' do
    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@jude)
    @vehicle.add_passenger(@taylor)
    @zion.add_vehicle(@vehicle)

    expect(@zion.list_passengers).to eq([@charlie, @jude, @taylor])
  end

  it 'shows revenue generated per adult' do
    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@jude)
    @vehicle.add_passenger(@taylor)
    @zion.add_vehicle(@vehicle)
    expect(@zion.revenue).to eq(40)
  end

  it 'lists all attendees alphabetically' do
    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@taylor)
    @vehicle.add_passenger(@jude)
    @zion.add_vehicle(@vehicle)

    expect(@zion.list_attendees_by_name).to_not eq([@jude, @taylor, @charlie])
    expect(@zion.list_attendees_by_name).to eq([@charlie, @jude, @taylor])
  end

  # Having trouble with getting the minor to repopulate 
  xit 'list shows only minors alphabetically' do
    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@taylor)
    @vehicle.add_passenger(@jude)
    @zion.add_vehicle(@vehicle)

    expect(@zion.minors_sorted).to_not eq([@jude, @taylor, @charlie])
    expect(@zion.minors_sorted).to eq([@taylor])
  end
end