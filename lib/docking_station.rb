require './lib/bike.rb'
class DockingStation

  attr_reader :bikes , :CAPACITY

  def initialize(capacity = 20)
    @bikes = []
    @CAPACITY = capacity
  end

  def release_bike
    if !empty?
      @bikes.each do |bike|
        if bike.working? == true
          @bikes.delete_at(@bikes.index(bike))
          return bike
        else
          raise "There are no working bikes available."
        end
      end
    else
      raise "There are no bikes available."
    end
  end

  def dock(bike, condition = "working")
    if full?
      raise "Docking station full."
    else
      @bikes << bike
      if condition == "broken"
        bike.condition  = "broken"
      end
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
