require './lib/winning_conditions.rb'
require './lib/grid.rb'

class Game
  attr_reader :winning_conditions, :grid, :turn_counter

  def play_move(value, location)
    @grid.record_move(value, location)
  end

  private

  def initialize
    @winning_conditions = Winning_Conditions.new
    @grid = Grid.new
    @turn_counter = 0
  end
end
