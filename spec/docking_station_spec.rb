require 'docking_station.rb'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'release working bikes' do
      #make bike
      bike = Bike.new
      #dock bikee
      subject.dock(bike)
      #release docked bike
      expect(subject.release_bike).to eq bike
    end
  end

  it 'docks a bike' do
    is_expected.to respond_to(:dock).with(1).argument
  end

  it 'docks working bikes' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'raises error when no more bike' do
    expect { subject.release_bike }.to raise_error "There are no bikes available."
  end

  it 'raises error dock is full' do
    (DockingStation.new.CAPACITY).times {
    subject.dock(Bike.new) }
    expect { subject.dock(Bike.new) }.to raise_error "Docking station full."
  end

  it 'raises error dock is full with different capacity' do
    subject = DockingStation.new(25)
    (subject.CAPACITY).times {
    subject.dock(Bike.new) }
    expect { subject.dock(Bike.new) }.to raise_error "Docking station full."
  end
end
