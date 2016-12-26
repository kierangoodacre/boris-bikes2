require 'docking_station.rb'
require 'bike_container.rb'

class ContainerHolder; include BikeContainer; end

  describe BikeContainer do

    let(:bike) { Bike.new }
    let(:holder) { ContainerHolder.new }

    def fill_station
      10.times{holder.dock(Bike.new)}
    end

    it 'should accept a bike' do
      expect(holder.bike_count).to eq(0)
      holder.dock(bike)
      expect(holder.bike_count).to eq(1)
    end

    it 'should be able to release a bike' do
      holder.dock(bike)
      expect(holder.bike_count).to eq(1)
      holder.release(bike)
      expect(holder.bike_count).to eq(0)
    end

    it 'should know when it is full' do
      print(holder,holder.capacity, 'hello')
      expect(holder.full?).to eq(false)
      fill_station
      print(holder.full?,'XXXXXXXXXX', holder.bike_count)
      expect(holder.full?).to be(true)
    end

    it 'should not accept a bike if its full' do
      fill_station
      expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError, 'station is full')
    end
    
    it 'should provide a list of working bikes' do
      working_bike, broken_bike = Bike.new, Bike.new
      broken_bike.break!
      holder.dock(broken_bike)
      holder.dock(working_bike)
      expect(holder.available_bikes).to eq([working_bike])
    end

  end
