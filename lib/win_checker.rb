class Win_Checker
  attr_reader :grid, :winner, :game_over

  def check_winning_conditions
    if horizontal_winner != 0
      @winner.change_winner(horizontal_winner)
    elsif vertical_winner != 0
      @winner.change_winner(vertical_winner)
    elsif diagonal_winner("right") != 0
      @winner.change_winner(diagonal_winner("right"))
    elsif diagonal_winner("left") != 0
      @winner.change_winner(diagonal_winner("left"))
    elsif tie?
      @winner.change_winner(0)
    end
  end

  private

  def initialize(grid)
    @grid = grid
    @winner = Winner.new
    @game_over = @winner.game_over
  end

  ## Checks for horizontal sum and winner

  def horizontal_winner ## sum of 3 means X wins. Sum of -3 means O wins.
    if @grid.field.any? { |row| horizontal_sum(row) == 3 }
      1
    elsif @grid.field.any? { |row| horizontal_sum(row) == -3 }
      -1
    else
      0
    end
  end

  def horizontal_sum(array)
    array.inject(0){ |sum, number| sum + number }
  end

  ## checks for vertical sum and winner from top to bottom.

  def vertical_winner ## sum of 3 means X wins. Sum of -3 means O wins.
    column = [0, 1, 2]
    if column.any?{ |column| vertical_sum(column) == 3 }
      1
    elsif column.any?{ |column| vertical_sum(column) == -3 }
      -1
    else
      0
    end
  end

  def vertical_sum(column)
    sum = 0
    row = [0, 1, 2]
    row.each { |row| sum += @grid.field[row][column] }
    return sum
  end

  ## Checks for diagonal sum and winner both left to right and right to left

  def diagonal_winner(direction)
    if diagonal_sum(direction) == 3
      1
    elsif diagonal_sum(direction) == -3
      -1
    else
      0
    end
  end

  def diagonal_sum(direction)
    sum = 0
    row = 0
    direction == "right" ? column = 0 : column = 2
    while row < @grid.field.length
      sum += grid.field[row][column]
      row += 1
      direction == "right" ? column += 1 : column -=1
    end
    sum
  end

  ## Checks to see if there is a tie

  def tie?
    !@grid.field.any?{ |row| row.any?{ |value| value == 0}}
  end

end
