require './lib/bike.rb'
class DockingStation

  attr_reader :bikes
  def initialize
    @bikes = []
    @capacity = 20
  end

  def release_bike
    raise "There are no bikes available." unless @bikes.length > 0
    @bikes.pop
  end

  def dock(bike)
    raise "Docking station full." unless @bikes.length < @capacity
    @bikes << bike
    return @bikes.last
  end

end
