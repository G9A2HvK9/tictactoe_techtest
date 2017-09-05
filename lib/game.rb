class Game
  attr_reader :grid, :turn, :win_checker

  def play_move(row, col)
    raise("The game is over") if @win_checker.game_over
    @turn == 0 ? play_X(row, col) : play_O(row, col)
    @win_checker.check_winning_conditions
    !@win_checker.winner.winner ? change_turn : @win_checker.winner.declare
  end

  private

  def initialize(turn = nil)
    @grid = Grid.new
    @win_checker = Win_Checker.new(@grid)
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
