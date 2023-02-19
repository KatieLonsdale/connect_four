require 'spec_helper'

describe Game do
  before(:each) do
    @game = Game.new
    @valid_columns = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
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

  describe '#get_computer_selection' do
    before(:each) do
      @computer_selection = @game.get_computer_selection
    end

    it 'returns a valid column selection' do
      expect(@computer_selection).to be_a String
      expect(@computer_selection.length).to eq(1)
      expect(@valid_columns).to include(@computer_selection)
    end
  end

  describe '#get_human_selection' do
    before(:each) do
      @human_selection = @game.get_human_selection
    end

    it 'returns a valid column selection' do
      expect(@human_selection).to be_a String
      expect(@human_selection.length).to eq(1)
      expect(@valid_columns).to include(@human_selection)
    end
  end

  describe '#valid_letter?' do
    it 'returns true if the letter matches a valid column' do
      expect(@game.valid_letter?('A')).to be true
      expect(@game.valid_letter?('G')).to be true
    end

    it 'returns false if the letter is not valid' do
      expect(@game.valid_letter?('a')).to be false
      expect(@game.valid_letter?(1)).to be false
      expect(@game.valid_letter?('AG')).to be false
      expect(@game.valid_letter?('Y')).to be false
    end
  end

  describe '#open_column?' do
    before(:each) do
      @game.board.grid['A'] = ['X', 'O', 'X', 'O', 'X', 'O']
      @game.board.grid['B'] = ['.', '.', '.', '.', 'X', 'O']
      @game.board.grid['C'] = ['.', '.', '.', '.', '.', '.']
    end

    it 'returns true if the column has open space available' do
      expect(@game.open_column?('B')).to be true
      expect(@game.open_column?('C')).to be true
    end

    it 'returns false if the column is full' do
      expect(@game.open_column?('A')).to be false
    end
  end
end
