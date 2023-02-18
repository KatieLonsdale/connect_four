require 'spec_helper'

describe Game do
  before(:each) do
    @game = Game.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@game).to be_a Game
    end

    it 'has a board' do
      expect(@game.board).to be_a Board
    end

    it 'has a human player' do
      expect(@game.human_player).to be_a Player
      expect(@game.human_player.is_human?).to be true
      expect(@game.human_player.is_computer?).to be false
    end

    it 'has a computer player' do
      expect(@game.computer_player).to be_a Player
      expect(@game.computer_player.is_computer?).to be true
      expect(@game.computer_player.is_human?).to be false
    end
  end
end
