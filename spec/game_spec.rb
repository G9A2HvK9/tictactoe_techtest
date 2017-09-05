describe Game do

  subject { Game.new }
  let (:game0) { Game.new(0) }
  let (:game1) { Game.new(1)}
  let (:grid) { subject.grid }

  it { is_expected.to be_an_instance_of(Game) }
  it { is_expected.to have_attributes(turn: nil) }
  it { is_expected.to respond_to(:play_move).with(2).arguments }

  it "should initialize with a grid, which is an instance of the grid class" do
    expect(grid).to be_an_instance_of(Grid)
  end

  describe "Functionality" do

    it "allows player to play an X move" do
      expect {game0.play_move(0,0)}.to change{game0.grid.field[0][0]}.by(1)
    end

    it "allows player to play an O move" do
      expect {game1.play_move(0,0)}.to change{game1.grid.field[0][0]}.by(-1)
    end

    it "resets the turn from 0 to 1 after a player has played their move" do
      expect {game0.play_move(0,0)}.to change{game0.turn}.by(1)
    end

    it "resets the turn from 1 to 0 after a player has played their move" do
      expect {game1.play_move(0,0)}.to change{game1.turn}.by(-1)
    end

    
  end


end
