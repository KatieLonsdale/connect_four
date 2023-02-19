require 'spec_helper'

describe ConnectFour do
  before(:each) do
    @connect_four = ConnectFour.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@connect_four).to be_a ConnectFour
    end

    it 'has a board' do
      expect(@connect_four.board).to be_a Board
    end

    it 'has a human player' do
      expect(@connect_four.human_player).to be_a Player
      expect(@connect_four.human_player.type).to eq(:human)
    end

    it 'has a computer player' do
      expect(@connect_four.computer_player).to be_a Player
      expect(@connect_four.computer_player.type).to eq(:computer)
    end
  end

  describe '#create_instances' do
    it 'creates instances' do
      expect(@connect_four.create_instances).to be_a Player
    end
  end
end
