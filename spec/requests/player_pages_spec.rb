require 'spec_helper'

describe "PlayerPages" do
  let(:submit) { "Create Player" }
  let(:tictactoe) { FactoryGirl.create(:tictactoe) }
  before { visit new_tictacto_player_path(tictactoe) }

  subject { page }  

  describe "New player page" do 
    it { should have_selector('title', text: full_title('Player Setup')) }
  end

  describe "with invalid information" do
    it "should not create a user" do
      expect { click_button submit }.not_to change(tictactoe.players, :count)
    end
    describe "after submission" do
      before { click_button submit }

      it { should have_content('Invalid player name.') }
    end
  end

  describe "with valid information" do

    before do
      @p1 = FactoryGirl.create(:player, tictactoe: tictactoe)
      @p2 = FactoryGirl.create(:player, tictactoe: tictactoe, name: "cpu", first_to_act: "false")
      9.times { FactoryGirl.create(:square, tictactoe: tictactoe) }      
      # fill_in "tictactoe_players_attributes_0_name", :with => "test"
      visit edit_tictacto_path(tictactoe)
    end

    it "should redirect user to play game page" do
      should have_selector('title', text: full_title('Play Game'))
    end
  end

end
