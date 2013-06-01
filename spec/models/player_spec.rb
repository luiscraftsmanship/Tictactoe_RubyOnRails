require 'spec_helper'

describe Player do
  before { @player = Player.new(name: "Test user", first_to_act: "true", win: 0, lose: 0, draw: 0) }
  subject { @player }

  it { should respond_to(:name) }
  it { should respond_to(:first_to_act) }
  it { should respond_to(:win) }
  it { should respond_to(:lose) }
  it { should respond_to(:draw) }
  it { should respond_to(:tictactoe_id) }
  
  it { should be_valid }

  describe "when name is not present" do
    before { @player.name = " " }

    it { should_not be_valid }
  end
end
