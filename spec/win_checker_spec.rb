describe Win_Checker do

  let (:grid) { Grid.new }
  subject { Win_Checker.new(grid)}

  it { is_expected.to be_an_instance_of(Win_Checker) }
  it { is_expected.to have_attributes(grid: grid) }

  it { is_expected.to respond_to (:check_winning_conditions) }

  describe "Functionality" do

    it "should return set the @winner attribute to O when X wins horizontally" do
      grid.record(X.new(0,0))
      grid.record(X.new(0,1))
      grid.record(X.new(0,2))
      subject.check_winning_conditions
      expect(subject.winner.winner).to eq("X")
    end

    it "should set the @winner attribute to O when O wins horizontally" do
      grid.record(O.new(0,0))
      grid.record(O.new(0,1))
      grid.record(O.new(0,2))
      subject.check_winning_conditions
      expect(subject.winner.winner).to eq("O")
    end

    it "should return set the @winner attribute to X when X wins vertically" do
      grid.record(X.new(0,0))
      grid.record(X.new(1,0))
      grid.record(X.new(2,0))
      subject.check_winning_conditions
      expect(subject.winner.winner).to eq("X")
    end

    it "should return set the @winner attribute to O when O wins vertically" do
      grid.record(O.new(0,0))
      grid.record(O.new(1,0))
      grid.record(O.new(2,0))
      subject.check_winning_conditions
      expect(subject.winner.winner).to eq("O")
    end

    it "should return set the @winner attribute to X when X wins Diagonally (1)" do
      grid.record(X.new(0,0))
      grid.record(X.new(1,1))
      grid.record(X.new(2,2))
      subject.check_winning_conditions
      expect(subject.winner.winner).to eq("X")
    end

    it "should return set the @winner attribute to X when X wins Diagonally (2)" do
      grid.record(X.new(0,2))
      grid.record(X.new(1,1))
      grid.record(X.new(2,0))
      subject.check_winning_conditions
      expect(subject.winner.winner).to eq("X")
    end

    it "should return set the @winner attribute to O when O wins Diagonally (1)" do
      grid.record(O.new(0,0))
      grid.record(O.new(1,1))
      grid.record(O.new(2,2))
      subject.check_winning_conditions
      expect(subject.winner.winner).to eq("O")
    end

    it "should return set the @winner attribute to O when O wins Diagonally (2)" do
      grid.record(O.new(0,2))
      grid.record(O.new(1,1))
      grid.record(O.new(2,0))
      subject.check_winning_conditions
      expect(subject.winner.winner).to eq("O")
    end

    it "should set the @winner attribute to 2 when all fields are taken and there is no winner" do
      grid.record(X.new(0,0))
      grid.record(O.new(0,1))
      grid.record(X.new(0,2))
      grid.record(O.new(1,0))
      grid.record(X.new(1,1))
      grid.record(O.new(1,2))
      grid.record(O.new(2,0))
      grid.record(X.new(2,1))
      grid.record(O.new(2,2))
      subject.check_winning_conditions
      expect(subject.winner.winner).to eq("It's a tie. Nobody")
    end
  end

end
