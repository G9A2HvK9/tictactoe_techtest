class Grid
  attr_reader :field

  def record(move)
    @field[move.row].insert(move.col, move.value)
  end

  private

  def initialize
    @field = [[0,0,0], [0,0,0], [0,0,0]]
  end
end
