describe Winner do

  subject { Winner.new }
  let (:winnerX) { Winner.new }
  let (:winnerO) { Winner.new }

  it { is_expected.to be_an_instance_of(Winner) }
  it { is_expected.to respond_to(:declare) }

  describe "#declare" do

    it "Returns 'X wins!' when initialized with a value of 1" do
      winnerX.change_winner(1)
      winnerX.declare
      expect(winnerX.message).to eq('X wins!')
    end

    it "Returns 'O wins!' when initialized with a value of -1" do
      winnerO.change_winner(-1)
      winnerO.declare
      expect(winnerO.message).to eq('O wins!')
    end
  end

end
