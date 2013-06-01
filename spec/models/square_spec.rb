require 'spec_helper'

describe Square do
  before { @square = Square.new(num: 0, value: "O") }
  subject { @square }

  it { should respond_to(:num) }
  it { should respond_to(:value) }
  it { should respond_to(:tictactoe_id) }

  it { should be_valid }
end
