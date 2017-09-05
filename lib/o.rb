class X
  attr_reader :value, :row, :col

  def print(value)
    print value
  end

  private

  def initialize(row = nil, col = nil)
    @value = 1
    @row = row
    @col = col
  end

end
