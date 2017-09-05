class Grid
  attr_reader :array

  def record_move(value, index)
    @array[index] = value
  end

  private

  def initialize
    @array = [0,0,0,0,0,0,0,0,0]
  end

end
