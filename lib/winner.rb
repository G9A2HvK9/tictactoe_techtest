class Winner
  attr_reader :message, :winner, :game_over

  def declare
    @message = "#{@winner} wins!"
    @game_over = true
  end

  def change_winner(arg)
    if arg == 1
       @winner = "X"
    elsif arg == -1
      @winner = "O"
    elsif arg == 0
      @winner = "It's a tie. Nobody"
    else
      @winner = nil
    end
  end

  private

  def initialize
    @winner = winner
    @game_over = false
  end

end
