describe "Feature test" do

  let (:game0) { Game.new(0) }
  let (:game1) { Game.new(1) }

  it "does not let you make a move in a field twice in a row" do
    expect{ game0.play_move(0,0) }.to change{ game0.grid.field[0][0] }.by(1)
    expect{ game0.play_move(0,0) }.to raise_error(RuntimeError)
  end

  it "does not let you play another move when the game is over" do
    expect{ game0.play_move(0,0) }.to change{ game0.grid.field[0][0] }.by(1)
    expect{ game0.play_move(0,0) }.to raise_error(RuntimeError)
    expect{ game0.play_move(0,1) }.to change{ game0.grid.field[0][1] }.by(-1)
    expect{ game0.play_move(2,2) }.to change{ game0.grid.field[2][2] }.by(1)
    expect{ game0.play_move(1,1) }.to change{ game0.grid.field[1][1] }.by(-1)
    expect{ game0.play_move(2,1) }.to change{ game0.grid.field[2][1] }.by(1)
    expect{ game0.play_move(2,0) }.to change{ game0.grid.field[2][0] }.by(-1)
    expect{ game0.play_move(1,2) }.to change{ game0.grid.field[1][2] }.by(1)
    game0.play_move(0,2)
    expect( game0.grid.field[0][2] ).to eq(-1)
    expect{ game0.play_move(1,2) }.to raise_error(RuntimeError)
  end

  describe "Horizontal win cases for X" do

    it "can play a full game of tic tac toe and declare X the winner in horizontal 0" do
      expect{ game0.play_move(0,0) }.to change{ game0.grid.field[0][0] }.by(1)
      expect{ game0.play_move(1,0) }.to change{ game0.grid.field[1][0] }.by(-1)
      expect{ game0.play_move(0,1) }.to change{ game0.grid.field[0][1] }.by(1)
      expect{ game0.play_move(1,1) }.to change{ game0.grid.field[1][1] }.by(-1)
      expect{ game0.play_move(2,0) }.to change{ game0.grid.field[2][0] }.by(1)
      expect{ game0.play_move(2,1) }.to change{ game0.grid.field[2][1] }.by(-1)
      expect{ game0.play_move(1,2) }.to change{ game0.grid.field[1][2] }.by(1)
      expect{ game0.play_move(2,2) }.to change{ game0.grid.field[2][2] }.by(-1)
      game0.play_move(0,2)
      expect( game0.grid.field[0][2] ).to eq(1)
      expect( game0.win_checker.winner.winner ).to eq("X")
    end

    it "can play a full game of tic tac toe and declare X the winner in horizontal 1" do
      expect{ game0.play_move(1,0) }.to change{ game0.grid.field[1][0] }.by(1)
      expect{ game0.play_move(2,0) }.to change{ game0.grid.field[2][0] }.by(-1)
      expect{ game0.play_move(1,1) }.to change{ game0.grid.field[1][1] }.by(1)
      expect{ game0.play_move(2,1) }.to change{ game0.grid.field[2][1] }.by(-1)
      expect{ game0.play_move(2,2) }.to change{ game0.grid.field[2][2] }.by(1)
      expect{ game0.play_move(0,2) }.to change{ game0.grid.field[0][2] }.by(-1)
      expect{ game0.play_move(0,1) }.to change{ game0.grid.field[0][1] }.by(1)
      expect{ game0.play_move(0,0) }.to change{ game0.grid.field[0][0] }.by(-1)
      game0.play_move(1,2)
      expect( game0.grid.field[1][2] ).to eq(1)
      expect( game0.win_checker.winner.winner ).to eq("X")
    end

    it "can play a full game of tic tac toe and declare X the winner in horizontal 2" do
      expect{ game0.play_move(2,0) }.to change{ game0.grid.field[2][0] }.by(1)
      expect{ game0.play_move(1,0) }.to change{ game0.grid.field[1][0] }.by(-1)
      expect{ game0.play_move(2,1) }.to change{ game0.grid.field[2][1] }.by(1)
      expect{ game0.play_move(1,1) }.to change{ game0.grid.field[1][1] }.by(-1)
      expect{ game0.play_move(0,0) }.to change{ game0.grid.field[0][0] }.by(1)
      expect{ game0.play_move(0,1) }.to change{ game0.grid.field[0][1] }.by(-1)
      expect{ game0.play_move(1,2) }.to change{ game0.grid.field[1][2] }.by(1)
      expect{ game0.play_move(0,2) }.to change{ game0.grid.field[0][2] }.by(-1)
      game0.play_move(2,2)
      expect( game0.grid.field[2][2] ).to eq(1)
      expect( game0.win_checker.winner.winner ).to eq("X")
    end
  end

  describe "Vertical win cases for X" do

    it "can play a full game of tic tac toe and declare X the winner in vertical 0" do
      expect{ game0.play_move(0,0) }.to change{ game0.grid.field[0][0] }.by(1)
      expect{ game0.play_move(0,1) }.to change{ game0.grid.field[0][1] }.by(-1)
      expect{ game0.play_move(1,0) }.to change{ game0.grid.field[1][0] }.by(1)
      expect{ game0.play_move(1,1) }.to change{ game0.grid.field[1][1] }.by(-1)
      expect{ game0.play_move(2,1) }.to change{ game0.grid.field[2][1] }.by(1)
      expect{ game0.play_move(0,2) }.to change{ game0.grid.field[0][2] }.by(-1)
      expect{ game0.play_move(1,2) }.to change{ game0.grid.field[1][2] }.by(1)
      expect{ game0.play_move(2,2) }.to change{ game0.grid.field[2][2] }.by(-1)
      game0.play_move(2,0)
      expect( game0.grid.field[2][0] ).to eq(1)
      expect( game0.win_checker.winner.winner ).to eq("X")
      expect( game0.win_checker.game_over).to be(true)
    end

    it "can play a full game of tic tac toe and declare X the winner in vertical 1" do
      expect{ game0.play_move(0,1) }.to change{ game0.grid.field[0][1] }.by(1)
      expect{ game0.play_move(0,0) }.to change{ game0.grid.field[0][0] }.by(-1)
      expect{ game0.play_move(1,1) }.to change{ game0.grid.field[1][1] }.by(1)
      expect{ game0.play_move(1,0) }.to change{ game0.grid.field[1][0] }.by(-1)
      expect{ game0.play_move(1,2) }.to change{ game0.grid.field[1][2] }.by(1)
      expect{ game0.play_move(2,2) }.to change{ game0.grid.field[2][2] }.by(-1)
      expect{ game0.play_move(2,0) }.to change{ game0.grid.field[2][0] }.by(1)
      expect{ game0.play_move(0,2) }.to change{ game0.grid.field[0][2] }.by(-1)
      game0.play_move(2,1)
      expect( game0.grid.field[2][1] ).to eq(1)
      expect( game0.win_checker.winner.winner ).to eq("X")
    end

    it "can play a full game of tic tac toe and declare X the winner in vertical 2" do
      expect{ game0.play_move(0,2) }.to change{ game0.grid.field[0][2] }.by(1)
      expect{ game0.play_move(0,1) }.to change{ game0.grid.field[0][1] }.by(-1)
      expect{ game0.play_move(1,2) }.to change{ game0.grid.field[1][2] }.by(1)
      expect{ game0.play_move(1,1) }.to change{ game0.grid.field[1][1] }.by(-1)
      expect{ game0.play_move(2,1) }.to change{ game0.grid.field[2][1] }.by(1)
      expect{ game0.play_move(2,0) }.to change{ game0.grid.field[2][0] }.by(-1)
      expect{ game0.play_move(0,0) }.to change{ game0.grid.field[0][0] }.by(1)
      expect{ game0.play_move(1,0) }.to change{ game0.grid.field[1][0] }.by(-1)
      game0.play_move(2,2)
      expect( game0.grid.field[2][2] ).to eq(1)
      expect( game0.win_checker.winner.winner ).to eq("X")
    end
  end

  describe "Diagonal win cases for X" do

    it "can play a full game of tic tac toe and declare X the winner in diagonal 1" do
      expect{ game0.play_move(0,0) }.to change{ game0.grid.field[0][0] }.by(1)
      expect{ game0.play_move(1,0) }.to change{ game0.grid.field[1][0] }.by(-1)
      expect{ game0.play_move(1,1) }.to change{ game0.grid.field[1][1] }.by(1)
      expect{ game0.play_move(2,1) }.to change{ game0.grid.field[2][1] }.by(-1)
      expect{ game0.play_move(2,0) }.to change{ game0.grid.field[2][0] }.by(1)
      expect{ game0.play_move(0,2) }.to change{ game0.grid.field[0][2] }.by(-1)
      expect{ game0.play_move(0,1) }.to change{ game0.grid.field[0][1] }.by(1)
      expect{ game0.play_move(1,2) }.to change{ game0.grid.field[1][2] }.by(-1)
      game0.play_move(2,2)
      expect( game0.grid.field[2][2] ).to eq(1)
      expect( game0.win_checker.winner.winner ).to eq("X")
    end

    it "can play a full game of tic tac toe and declare X the winner in diagonal 2" do
      expect{ game0.play_move(2,0) }.to change{ game0.grid.field[2][0] }.by(1)
      expect{ game0.play_move(2,1) }.to change{ game0.grid.field[2][1] }.by(-1)
      expect{ game0.play_move(1,1) }.to change{ game0.grid.field[1][1] }.by(1)
      expect{ game0.play_move(1,0) }.to change{ game0.grid.field[1][0] }.by(-1)
      expect{ game0.play_move(1,2) }.to change{ game0.grid.field[1][2] }.by(1)
      expect{ game0.play_move(0,0) }.to change{ game0.grid.field[0][0] }.by(-1)
      expect{ game0.play_move(0,1) }.to change{ game0.grid.field[0][1] }.by(1)
      expect{ game0.play_move(2,2) }.to change{ game0.grid.field[2][2] }.by(-1)
      game0.play_move(0,2)
      expect( game0.grid.field[0][2] ).to eq(1)
      expect( game0.win_checker.winner.winner ).to eq("X")
    end
  end

  describe " Horizontal win cases for O" do

    it "can play a full game of tic tac toe and declare O the winner in horizontal 0" do
      expect{ game1.play_move(0,0) }.to change{ game1.grid.field[0][0] }.by(-1)
      expect{ game1.play_move(1,0) }.to change{ game1.grid.field[1][0] }.by(1)
      expect{ game1.play_move(0,1) }.to change{ game1.grid.field[0][1] }.by(-1)
      expect{ game1.play_move(1,1) }.to change{ game1.grid.field[1][1] }.by(1)
      expect{ game1.play_move(2,0) }.to change{ game1.grid.field[2][0] }.by(-1)
      expect{ game1.play_move(2,1) }.to change{ game1.grid.field[2][1] }.by(1)
      expect{ game1.play_move(1,2) }.to change{ game1.grid.field[1][2] }.by(-1)
      expect{ game1.play_move(2,2) }.to change{ game1.grid.field[2][2] }.by(1)
      game1.play_move(0,2)
      expect( game1.grid.field[0][2] ).to eq(-1)
      expect( game1.win_checker.winner.winner ).to eq("O")
    end

    it "can play a full game of tic tac toe and declare O the winner in horizontal 1" do
      expect{ game1.play_move(1,0) }.to change{ game1.grid.field[1][0] }.by(-1)
      expect{ game1.play_move(2,0) }.to change{ game1.grid.field[2][0] }.by(1)
      expect{ game1.play_move(1,1) }.to change{ game1.grid.field[1][1] }.by(-1)
      expect{ game1.play_move(2,1) }.to change{ game1.grid.field[2][1] }.by(1)
      expect{ game1.play_move(2,2) }.to change{ game1.grid.field[2][2] }.by(-1)
      expect{ game1.play_move(0,2) }.to change{ game1.grid.field[0][2] }.by(1)
      expect{ game1.play_move(0,1) }.to change{ game1.grid.field[0][1] }.by(-1)
      expect{ game1.play_move(0,0) }.to change{ game1.grid.field[0][0] }.by(1)
      game1.play_move(1,2)
      expect( game1.grid.field[1][2] ).to eq(-1)
      expect( game1.win_checker.winner.winner ).to eq("O")
    end

    it "can play a full game of tic tac toe and declare O the winner in horizontal 2" do
      expect{ game1.play_move(2,0) }.to change{ game1.grid.field[2][0] }.by(-1)
      expect{ game1.play_move(1,0) }.to change{ game1.grid.field[1][0] }.by(1)
      expect{ game1.play_move(2,1) }.to change{ game1.grid.field[2][1] }.by(-1)
      expect{ game1.play_move(1,1) }.to change{ game1.grid.field[1][1] }.by(1)
      expect{ game1.play_move(0,0) }.to change{ game1.grid.field[0][0] }.by(-1)
      expect{ game1.play_move(0,1) }.to change{ game1.grid.field[0][1] }.by(1)
      expect{ game1.play_move(1,2) }.to change{ game1.grid.field[1][2] }.by(-1)
      expect{ game1.play_move(0,2) }.to change{ game1.grid.field[0][2] }.by(1)
      game1.play_move(2,2)
      expect( game1.grid.field[2][2] ).to eq(-1)
      expect( game1.win_checker.winner.winner ).to eq("O")
    end
  end

  describe "Vertical win cases for O" do

    it "can play a full game of tic tac toe and declare O the winner in vertical 0" do
      expect{ game1.play_move(0,0) }.to change{ game1.grid.field[0][0] }.by(-1)
      expect{ game1.play_move(0,1) }.to change{ game1.grid.field[0][1] }.by(1)
      expect{ game1.play_move(1,0) }.to change{ game1.grid.field[1][0] }.by(-1)
      expect{ game1.play_move(1,1) }.to change{ game1.grid.field[1][1] }.by(1)
      expect{ game1.play_move(2,1) }.to change{ game1.grid.field[2][1] }.by(-1)
      expect{ game1.play_move(0,2) }.to change{ game1.grid.field[0][2] }.by(1)
      expect{ game1.play_move(1,2) }.to change{ game1.grid.field[1][2] }.by(-1)
      expect{ game1.play_move(2,2) }.to change{ game1.grid.field[2][2] }.by(1)
      game1.play_move(2,0)
      expect( game1.grid.field[2][0] ).to eq(-1)
      expect( game1.win_checker.winner.winner ).to eq("O")
      expect( game1.win_checker.game_over).to be(true)
    end

    it "can play a full game of tic tac toe and declare O the winner in vertical 1" do
      expect{ game1.play_move(0,1) }.to change{ game1.grid.field[0][1] }.by(-1)
      expect{ game1.play_move(0,0) }.to change{ game1.grid.field[0][0] }.by(1)
      expect{ game1.play_move(1,1) }.to change{ game1.grid.field[1][1] }.by(-1)
      expect{ game1.play_move(1,0) }.to change{ game1.grid.field[1][0] }.by(1)
      expect{ game1.play_move(1,2) }.to change{ game1.grid.field[1][2] }.by(-1)
      expect{ game1.play_move(2,2) }.to change{ game1.grid.field[2][2] }.by(1)
      expect{ game1.play_move(2,0) }.to change{ game1.grid.field[2][0] }.by(-1)
      expect{ game1.play_move(0,2) }.to change{ game1.grid.field[0][2] }.by(1)
      game1.play_move(2,1)
      expect( game1.grid.field[2][1] ).to eq(-1)
      expect( game1.win_checker.winner.winner ).to eq("O")
    end

    it "can play a full game of tic tac toe and declare O the winner in vertical 2" do
      expect{ game1.play_move(0,2) }.to change{ game1.grid.field[0][2] }.by(-1)
      expect{ game1.play_move(0,1) }.to change{ game1.grid.field[0][1] }.by(1)
      expect{ game1.play_move(1,2) }.to change{ game1.grid.field[1][2] }.by(-1)
      expect{ game1.play_move(1,1) }.to change{ game1.grid.field[1][1] }.by(1)
      expect{ game1.play_move(2,1) }.to change{ game1.grid.field[2][1] }.by(-1)
      expect{ game1.play_move(2,0) }.to change{ game1.grid.field[2][0] }.by(1)
      expect{ game1.play_move(0,0) }.to change{ game1.grid.field[0][0] }.by(-1)
      expect{ game1.play_move(1,0) }.to change{ game1.grid.field[1][0] }.by(1)
      game1.play_move(2,2)
      expect( game1.grid.field[2][2] ).to eq(-1)
      expect( game1.win_checker.winner.winner ).to eq("O")
    end
  end

  describe "Diagonal win cases for O" do

    it "can play a full game of tic tac toe and declare O the winner in diagonal 1" do
      expect{ game1.play_move(0,0) }.to change{ game1.grid.field[0][0] }.by(-1)
      expect{ game1.play_move(1,0) }.to change{ game1.grid.field[1][0] }.by(1)
      expect{ game1.play_move(1,1) }.to change{ game1.grid.field[1][1] }.by(-1)
      expect{ game1.play_move(2,1) }.to change{ game1.grid.field[2][1] }.by(1)
      expect{ game1.play_move(2,0) }.to change{ game1.grid.field[2][0] }.by(-1)
      expect{ game1.play_move(0,2) }.to change{ game1.grid.field[0][2] }.by(1)
      expect{ game1.play_move(0,1) }.to change{ game1.grid.field[0][1] }.by(-1)
      expect{ game1.play_move(1,2) }.to change{ game1.grid.field[1][2] }.by(1)
      game1.play_move(2,2)
      expect( game1.grid.field[2][2] ).to eq(-1)
      expect( game1.win_checker.winner.winner ).to eq("O")
    end

    it "can play a full game of tic tac toe and declare O the winner in diagonal 2" do
      expect{ game1.play_move(2,0) }.to change{ game1.grid.field[2][0] }.by(-1)
      expect{ game1.play_move(2,1) }.to change{ game1.grid.field[2][1] }.by(1)
      expect{ game1.play_move(1,1) }.to change{ game1.grid.field[1][1] }.by(-1)
      expect{ game1.play_move(1,0) }.to change{ game1.grid.field[1][0] }.by(1)
      expect{ game1.play_move(1,2) }.to change{ game1.grid.field[1][2] }.by(-1)
      expect{ game1.play_move(0,0) }.to change{ game1.grid.field[0][0] }.by(1)
      expect{ game1.play_move(0,1) }.to change{ game1.grid.field[0][1] }.by(-1)
      expect{ game1.play_move(2,2) }.to change{ game1.grid.field[2][2] }.by(1)
      game1.play_move(0,2)
      expect( game1.grid.field[0][2] ).to eq(-1)
      expect( game1.win_checker.winner.winner ).to eq("O")
    end
  end
end
