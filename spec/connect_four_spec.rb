require 'spec_helper'

describe ConnectFour do
  before(:each) do
    @connect_four = ConnectFour.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@connect_four).to be_a ConnectFour
    end

    it 'has a human player' do
      expect(@connect_four.human_player).to be_a Player
      expect(@connect_four.human_player.type).to eq(:human)
    end

    it 'has a computer player' do
      expect(@connect_four.computer_player).to be_a Player
      expect(@connect_four.computer_player.type).to eq(:computer)
    end

    it 'has a board that is nil by default' do
      expect(@connect_four.board).to eq(nil)
    end

    it 'has a game that is nil by default' do
      expect(@connect_four.game).to eq(nil)
    end
  end

  describe '#create_players' do
    it 'creates players' do
      expect(@connect_four.create_players).to be_a Player
    end
  end

  describe '#create_new_game' do
    it 'creates a new game and passes attributes' do
      expect(@connect_four.create_new_game).to be_a Game
      expect(@connect_four.game.board).to eq(@connect_four.board)
      expect(@connect_four.game.human_player).to eq(@connect_four.human_player)
      expect(@connect_four.game.computer_player).to eq(@connect_four.computer_player)
    end
  end

  describe '#show_welcome_message' do
    it 'shows a welcome message to the user' do
      expect(@connect_four.show_welcome_message).to eq('Welcome to Connect Four!')
    end
  end

  describe '#show_main_menu' do
    it 'shows a main menu to the user' do
      expect(@connect_four.show_main_menu).to eq('Enter p to play or q to quit.')
    end
  end
end
