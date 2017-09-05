describe Game do

  describe "#initialize" do
    it "Is an instance of the Game class" do
      expect(subject).to be_an_instance_of(Game)
    end

    it "instantiates with two objects - winning_conditions and grid" do
      expect(subject).to have_attributes(:winning_conditions => instance_of(Winning_Conditions), :grid => instance_of(Grid))
    end

    it "instantiates with one instance variable - turn_counter - which is 0" do
      expect(subject).to have_attributes(:turn_counter => 0)
    end
  end

  describe "#play_move" do
    it "can be called on the Game class with 3 arguments" do
      expect(subject).to respond_to(:play_move).with(2).arguments
    end
    context "when a move is played on index 0 of the grid, while turn counter is 0" do
      it "sets grid position 0 to 1" do
        expect{ subject.play_move(1, 0) }.to change{ subject.grid.array[0] }.from(0).to(1)
      end
      it "updates the turn_counter from 0 to 1" do
        expect{ subject.play_move(1, 0) }.to change{ subject.turn_counter }.from(0).to(1)
      end
    end
    context "when a field is played twice" do
      it "throws an argument error  with message 'This field is already taken'" do
        subject.play_move(1, 0)
        expect{ subject.play_move(-1, 0) }.to raise_error(ArgumentError, 'This field is already taken')
      end
    end
    context "when a field is played with an input other than 1 or -1" do
      it "throws an argument error  with message 'This field is already taken'" do
        expect{ subject.play_move(0, 0) }.to raise_error(ArgumentError, 'That is not a valid input')
      end
    end
    context "when a move is played in an index that is not on the grid" do
      it "throws an argument error  with message 'That is not a valid move'" do
        expect{ subject.play_move(1, 9) }.to raise_error(ArgumentError, 'That is not a valid move')
        expect{ subject.play_move(1, -1) }.to raise_error(ArgumentError, 'That is not a valid move')
      end
    end
  end
end
