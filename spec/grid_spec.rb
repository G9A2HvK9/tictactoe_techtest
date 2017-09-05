describe Grid do

  describe "#initialize" do
    it "Is an instance of the Grid class" do
      expect(subject).to be_an_instance_of(Grid)
    end

    it "instantiates with one instance variable - array - which is [0,0,0,0,0,0,0,0,0]" do
      expect(subject).to have_attributes(:array => [0,0,0,0,0,0,0,0,0])
    end
  end

  describe "#record_move" do
    it "can be called on the Grid class with 2 arguments" do
      expect(subject).to respond_to(:record_move).with(2).arguments
    end

    context "when record_move is called on index 0 of the array" do
      it "sets grid position 0 to 1" do
        expect{ subject.record_move(1, 0) }.to change{ subject.array[0] }.from(0).to(1)
      end
    end
  end

end
