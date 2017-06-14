class Game
  attr_reader :grid, :turn

  def play_move(row, col)
    @turn == 0 ? play_X(row, col) : play_O(row, col)
    change_turn
  end

  private

  def initialize(turn = nil)
    @grid = Grid.new
    @turn = turn
  end

  def play_X(row, col)
    @grid.record(X.new(row, col))
  end

  def play_O(row, col)
    @grid.record(O.new(row, col))
  end

  def change_turn
    @turn == 0 ? @turn = 1 : @turn = 0
  end
end
