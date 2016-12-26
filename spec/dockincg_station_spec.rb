require 'docking_station.rb'
require 'bike_container.rb'

describe DockingStation do

  let(:station) { DockingStation.new(capacity:123) }

  it 'should allow the setting of capacity' do
    expect(station.capacity).to eq(123)
  end

end
