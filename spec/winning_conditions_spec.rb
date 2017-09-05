describe Winning_Conditions do

  describe "#initialize" do
    it "Is an instance of the Winning Conditions class" do
      expect(subject).to be_an_instance_of(Winning_Conditions)
    end
    it "instantiates with an instance variable - value - which is set to false" do
      expect(subject).to have_attributes(:value => false)
    end
  end

  describe "#checker" do
    it "can be called on Winning Conditions with one argument" do
      expect(subject).to respond_to(:checker).with(1).argument
    end
    context "when a winning move is played" do
      let(:grid) { double(:grid, array: [0,0,1,0,0,1,0,0,1]) }
      it "sets the value attribute to true" do
        expect{ subject.checker(grid) }.to change{ subject.value }.from(false).to(true)
      end
    end
  end

end
