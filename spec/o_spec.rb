describe O do

  it { is_expected.to be_an_instance_of(O) }
  it { is_expected.to have_attributes(value: -1, row: nil, col: nil) }
  it { is_expected.to respond_to(:print).with(1).argument }

end
