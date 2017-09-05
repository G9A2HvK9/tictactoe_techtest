require './lib/winning_conditions.rb'
require './lib/grid.rb'

class Game
  attr_reader :winning_conditions, :grid, :turn_counter

  def play_move(value, index)
    guard_conditions(value, index)
    @grid.record_move(value, index)
    update_turn_counter
  end

  private

  def initialize
    @winning_conditions = Winning_Conditions.new
    @grid = Grid.new
    @turn_counter = 0
  end

  def update_turn_counter
    @turn_counter += 1
  end

  def guard_conditions(value, index)
    raise ArgumentError, 'That is not a valid move' if index < 0 || index > 8
    raise ArgumentError, 'This field is already taken' if @grid.array[index] != 0
    raise ArgumentError, 'That is not a valid input' if value != (1 || -1)
  end
end
