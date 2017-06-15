describe "Feature test" do

  let (:game0) { Game.new(0) }
  let (:game1) { Game.new(1) }

  it "can play a full game of tic tac toe and declare O the winner in diagonal 1" do
    expect{ game0.play_move(0,0) }.to change{ game0.grid.field[0][0] }.by(1)
    expect{ game0.play_move(0,1) }.to change{ game0.grid.field[0][1] }.by(-1)
    expect{ game0.play_move(2,2) }.to change{ game0.grid.field[2][2] }.by(1)
    expect{ game0.play_move(1,1) }.to change{ game0.grid.field[1][1] }.by(-1)
    expect{ game0.play_move(2,1) }.to change{ game0.grid.field[2][1] }.by(1)
    expect{ game0.play_move(2,0) }.to change{ game0.grid.field[2][0] }.by(-1)
    expect{ game0.play_move(1,2) }.to change{ game0.grid.field[1][2] }.by(1)
    game0.play_move(0,2)
    expect( game0.grid.field[0][2] ).to eq(-1)
    expect( game0.win_checker.winner.winner ).to eq("O")
  end

  it "can play a full game of tic tac toe and declare O the winner in diagonal 2" do
    expect{ game0.play_move(0,0) }.to change{ game0.grid.field[0][0] }.by(1)
    expect{ game0.play_move(0,1) }.to change{ game0.grid.field[0][1] }.by(-1)
    expect{ game0.play_move(2,2) }.to change{ game0.grid.field[2][2] }.by(1)
    expect{ game0.play_move(1,1) }.to change{ game0.grid.field[1][1] }.by(-1)
    expect{ game0.play_move(2,1) }.to change{ game0.grid.field[2][1] }.by(1)
    expect{ game0.play_move(2,0) }.to change{ game0.grid.field[2][0] }.by(-1)
    expect{ game0.play_move(1,2) }.to change{ game0.grid.field[1][2] }.by(1)
    game0.play_move(0,2)
    expect( game0.grid.field[0][2] ).to eq(-1)
    expect( game0.win_checker.winner.winner ).to eq("O")
  end



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

end
