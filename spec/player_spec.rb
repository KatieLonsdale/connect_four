require 'spec_helper'

describe Player do
  before(:each) do
    @player = Player.new(:human)
    @player_2 = Player.new(:computer)
  end
  describe '#initialize' do
    it 'exists' do
      expect(@player).to be_a Player
    end

    it 'has a type' do
      expect(@player.type).to eq(:human)
      expect(@player_2.type).to eq(:computer)
    end

    it 'has a piece' do
      expect(@player.piece).to be true
      expect(@player_2.piece).to be true
    end
  end

  describe '#assign_piece' do
    it 'assigns the correct piece based on type' do
      expect(@player.assign_piece).to eq('X')
      expect(@player_2.assign_piece).to eq('O')
    end
  end
end