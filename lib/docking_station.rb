require './lib/bike.rb'
class DockingStation

  attr_reader :bikes , :CAPACITY

  def initialize(capacity = 20)
    @bikes = []
    @CAPACITY = capacity
  end

  def release_bike
    if empty?
      raise "There are no bikes available."
    else
      @bikes.pop
    end
  end

  def dock(bike)
    if full?
      raise "Docking station full."
    else
      @bikes << bike
      return @bikes.last
    end
  end

  private
  def full?
    @bikes.length >= @CAPACITY ? (return true) : (return false)
  end

  def empty?
    @bikes.length <= 0 ? (return true) : (return false)
  end
end
