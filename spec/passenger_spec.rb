require './lib/passenger'

RSpec.describe Passenger do
  before(:each) do
    @charlie = Passenger.new({name: "Charlie", age: 18})  
    @taylor = Passenger.new({name: "Taylor", age: 12})  
  end

  it "exists" do
    expect(@charlie).to be_instance_of(Passenger)
  end

  it 'tests charlies attributes' do
    expect(@charlie.name).to eq("Charlie")
    expect(@charlie.age).to eq(18)
    expect(@charlie.adult?).to eq(true)
  end

  it 'tests taylors adult? status' do
    expect(@taylor.age).to eq(12)
    expect(@taylor.adult?).to eq(false)
  end

  it 'tests charlies driver? status' do
    expect(@charlie.driver?).to eq(false)

    @charlie.drive

    expect(@charlie.driver?).to eq(true)
  end
end