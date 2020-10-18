require 'docking_station.rb'

describe DockingStation do
  let(:bike) {double(:working? => "broken", :condition= => "broken")}
  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'release working bikes' do
      #make bike
      #dock bikee
      allow(bike).to receive(:condition).and_return("working")
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      #release docked bike
      expect(subject.release_bike).to be_working
    end
  end

  it 'release only working bikes' do
    #make bike
    #dock bikee
    allow(bike).to receive(:condition).and_return("broken")
    allow(bike).to receive(:working?).and_return(false)
    subject.dock(bike, "broken")
    #release docked bike
    expect {subject.release_bike}.to raise_error "There are no working bikes available."
  end


  it 'docks a bike' do
    is_expected.to respond_to(:dock).with(1).argument
  end

  it 'docks a not working bike' do
    is_expected.to respond_to(:dock).with(2).argument
  end

  it 'docks working bikes' do
    expect(subject.dock(bike)).to eq bike
  end

  it 'docks not working bikes' do
    allow(bike).to receive(:condition).and_return("broken")
    subject.dock(bike, "broken")
    expect(bike.condition).to eq "broken"
  end

  it 'raises error when no more bike' do
    expect { subject.release_bike }.to raise_error "There are no bikes available."
  end

  it 'raises error dock is full' do
    (DockingStation.new.CAPACITY).times {
    subject.dock(bike) }
    expect { subject.dock(bike) }.to raise_error "Docking station full."
  end

  it 'raises error dock is full with different capacity' do
    subject = DockingStation.new(25)
    (subject.CAPACITY).times {
    subject.dock(bike)}
    expect { subject.dock(bike) }.to raise_error "Docking station full."
  end

end
