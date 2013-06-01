require 'spec_helper'

describe "Tictactoe pages" do

  subject { page }  

  describe "Home page (new)" do
    before { visit root_path }

    it { should have_selector('title', text: full_title('Welcome')) }

    let(:submit) { "Start Game!" }

    describe "when clicking on start game" do
      it "should create a new game board" do
        expect { click_button submit }.to change(Tictactoe, :count).by(1)
      end
      it "should create 9 game squares" do
        expect { click_button submit }.to change(Square, :count).by(9)
      end      
    end
  end  

  describe "Edit page (shared)" do
    let(:tictactoe) { FactoryGirl.create(:tictactoe) }    
    
    before do 
      @p1 = FactoryGirl.create(:player, tictactoe: tictactoe)
      @p2 = FactoryGirl.create(:player, tictactoe: tictactoe, name: "cpu", first_to_act: "false")
      9.times { FactoryGirl.create(:square, tictactoe: tictactoe) }
      visit edit_tictacto_path(tictactoe)
    end

    it { should have_selector('title', text: full_title('Play Game')) }

    context "stats for human player" do
      it "should display win totals" do
        should have_content(@p1.win)
      end    
      it "should display lose totals" do
        should have_content(@p1.lose)
      end   
      it "should display draw totals" do
        should have_content(@p1.draw)
      end    
    end
    context "stats for computer player" do
      it "should display win totals" do
        should have_content(@p2.win)
      end    
      it "should display lose totals" do
        should have_content(@p2.lose)
      end   
      it "should display draw totals" do
        should have_content(@p2.draw)
      end  
    end
    context "gameboard display" do
      it "should have display area for square 0" do
        should have_selector('div.square0')
      end    
      it "should have display area for square 1" do
        should have_selector('div.square1')
      end   
      it "should have display area for square 2" do
        should have_selector('div.square2')
      end   
      it "should have display area for square 3" do
        should have_selector('div.square3')
      end   
      it "should have display area for square 4" do
        should have_selector('div.square4')
      end   
      it "should have display area for square 5" do
        should have_selector('div.square5')
      end   
      it "should have display area for square 6" do
        should have_selector('div.square6')
      end   
      it "should have display area for square 7" do
        should have_selector('div.square7')
      end   
      it "should have display area for square 8" do
        should have_selector('div.square8')
      end                                                        
    end    
  end  


  describe "Edit page (human player first to act)" do
    let(:tictactoe) { FactoryGirl.create(:tictactoe) }    
    
    before do 
      @p1 = FactoryGirl.create(:player, tictactoe: tictactoe)
      @p2 = FactoryGirl.create(:player, tictactoe: tictactoe, name: "cpu", first_to_act: "false")
      9.times { FactoryGirl.create(:square, tictactoe: tictactoe) }
      visit edit_tictacto_path(tictactoe)
    end

    it "should instruct human player to select a square" do
      should have_content('select a square')
    end    
    it "should indicate that it is human player's turn" do
      should have_selector('div.player-turn-marker', text: "Player 1")
    end      
    it "should display human player's name" do
      should have_selector('div.player-1-turn', text: @p1.name)
    end  
  end  

  describe "Edit page (computer player first to act)" do
    let(:tictactoe) { FactoryGirl.create(:tictactoe) }    
    
    before do 
      @p1 = FactoryGirl.create(:player, tictactoe: tictactoe, first_to_act: "false")
      @p2 = FactoryGirl.create(:player, tictactoe: tictactoe, name: "cpu", first_to_act: "true")
      9.times { FactoryGirl.create(:square, tictactoe: tictactoe) }
      visit edit_tictacto_path(tictactoe)
    end

    it "should display that computer player is thinking..." do
      should have_content('is thinking...')
    end    
    it "should indicate that it is computer player's turn" do
      should have_selector('div.player-turn-marker', text: "Player 2")
    end
    it "should display computer player's name" do
      should have_selector('div.player-2-turn', text: @p2.name)
    end      
  end  

  describe "Show page" do
    let(:tictactoe) { FactoryGirl.create(:tictactoe) }    
    
    before do 
      @p1 = FactoryGirl.create(:player, tictactoe: tictactoe, first_to_act: "false")
      @p2 = FactoryGirl.create(:player, tictactoe: tictactoe, name: "cpu", first_to_act: "true")
      9.times { FactoryGirl.create(:square, tictactoe: tictactoe) }
      visit tictacto_path(tictactoe)
    end

    it { should have_selector('title', text: full_title('Results')) }

    it "should display 'Tic Tac Toe Results'" do
      should have_content('Tic Tac Toe Results')
    end    
    it { should have_button('Quit.') }
    it { should have_button('Try again!') }

    describe "the quit button" do
      it "should redirect user back to homepage" do
        click_button 'Quit.'
        page.should have_selector('title', text: full_title('Welcome'))
      end
    end

    context "gameboard display" do
      it "should have display area for square 0" do
        should have_selector('div.square0')
      end    
      it "should have display area for square 1" do
        should have_selector('div.square1')
      end   
      it "should have display area for square 2" do
        should have_selector('div.square2')
      end   
      it "should have display area for square 3" do
        should have_selector('div.square3')
      end   
      it "should have display area for square 4" do
        should have_selector('div.square4')
      end   
      it "should have display area for square 5" do
        should have_selector('div.square5')
      end   
      it "should have display area for square 6" do
        should have_selector('div.square6')
      end   
      it "should have display area for square 7" do
        should have_selector('div.square7')
      end   
      it "should have display area for square 8" do
        should have_selector('div.square8')
      end                                                        
    end 


  end  

end
