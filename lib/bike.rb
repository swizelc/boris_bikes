class Bike

  attr_accessor :condition
  def initialize(condition = "working")
    @condition = condition
  end

  def working?
    @condition == "working" ? (return true) : (return false)
  end

end
