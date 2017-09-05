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

    context "when a move is played on index 0 of the grid" do
      it "sets grid position 0 to 1" do
        expect{ subject.play_move(1,  0) }.to change{ subject.grid.array[0] }.from(0).to(1)
      end
    end
    context "when a move is played on index 3 of the grid" do
      it "sets grid position 3 to -1" do
        expect{ subject.play_move(-1,  3) }.to change{ subject.grid.array[3] }.from(0).to(-1)
      end
    end
    context "when a move is played on index 0 of the grid" do
      it "sets grid position 8 to 1" do
        expect{ subject.play_move(1,  08) }.to change{ subject.grid.array[8] }.from(0).to(1)
      end
    end
  end

end
