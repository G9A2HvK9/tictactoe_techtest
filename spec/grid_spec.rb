describe Grid do

  subject { Grid.new }

  it { is_expected.to be_an_instance_of(Grid) }
  it { is_expected.to have_attributes(field: [[0,0,0],[0,0,0],[0,0,0]]) }
  it { is_expected.to respond_to(:record).with(1).argument }

  describe "Functionality" do

    it "Can record an X move in the correct field" do
      expect{ subject.record(X.new(0,0)) }.to change{ subject.field[0][0] }.by(1)
      expect{ subject.record(X.new(0,1)) }.to change{ subject.field[0][1] }.by(1)
      expect{ subject.record(X.new(0,2)) }.to change{ subject.field[0][2] }.by(1)

      expect{ subject.record(X.new(1,0)) }.to change{ subject.field[1][0] }.by(1)
      expect{ subject.record(X.new(1,1)) }.to change{ subject.field[1][1] }.by(1)
      expect{ subject.record(X.new(1,2)) }.to change{ subject.field[1][2] }.by(1)

      expect{ subject.record(X.new(2,0)) }.to change{ subject.field[2][0] }.by(1)
      expect{ subject.record(X.new(2,1)) }.to change{ subject.field[2][1] }.by(1)
      expect{ subject.record(X.new(2,2)) }.to change{ subject.field[2][2] }.by(1)
    end

    it "Can record an O move in the correct field" do
      expect{ subject.record(O.new(0,0)) }.to change{ subject.field[0][0] }.by(-1)
      expect{ subject.record(O.new(0,1)) }.to change{ subject.field[0][1] }.by(-1)
      expect{ subject.record(O.new(0,2)) }.to change{ subject.field[0][2] }.by(-1)

      expect{ subject.record(O.new(1,0)) }.to change{ subject.field[1][0] }.by(-1)
      expect{ subject.record(O.new(1,1)) }.to change{ subject.field[1][1] }.by(-1)
      expect{ subject.record(O.new(1,2)) }.to change{ subject.field[1][2] }.by(-1)

      expect{ subject.record(O.new(2,0)) }.to change{ subject.field[2][0] }.by(-1)
      expect{ subject.record(O.new(2,1)) }.to change{ subject.field[2][1] }.by(-1)
      expect{ subject.record(O.new(2,2)) }.to change{ subject.field[2][2] }.by(-1)
    end
  end

  describe "Guard conditions" do

    it "raises an exception if a field is already full" do
      subject.record(O.new(0,0))
      expect{ subject.record(X.new(0,0)) }.to throw_error
    end
  end



end
