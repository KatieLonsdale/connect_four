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

  describe '#assign_piece' do
    it 'assigns the correct piece based on type' do
      expect(@player.assign_piece).to eq('X')
      expect(@player_2.assign_piece).to eq('O')
    end
  end

  describe '#is_computer?' do
    it 'returns true if player is computer' do
      expect(@player.is_computer?).to be false
      expect(@player_2.is_computer?).to be true
    end
  end

  describe '#is_human?' do
    it 'returns true if player is human' do
      expect(@player.is_human?).to be true
      expect(@player_2.is_human?).to be false
    end
  end  
end