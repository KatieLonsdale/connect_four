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
      expect(@player.piece).to eq('X')
      expect(@player_2.piece).to eq('O')
    end
  end
end