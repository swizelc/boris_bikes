require 'vans'

describe Vans do
  let(:dockingstation) {DockingStation.new}
  describe '#pickup' do
    it 'Picks up broken bikes from the docking station' do
      allow(dockingstation).to receive(:brokenbikes).and_return([])
      expect(subject.pickup(dockingstation.brokenbikes)).to eq []
    end
  end
end
