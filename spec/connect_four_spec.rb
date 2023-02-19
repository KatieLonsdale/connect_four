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
end
