class Grid
  attr_reader :field

  def record(move)
    field_full? raise ("This field is already taken. Please try again")
    @field[move.row][move.col] = move.value
  end

  private

  def initialize
    @field = [[0,0,0], [0,0,0], [0,0,0]]
  end

  def field_full?(move)
    !@field[move.row][move,.col].empty?
  end
end
