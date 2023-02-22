require 'stringio'
require 'spec_helper'


describe Game do
  before(:each) do
    @connect_four = ConnectFour.new
    @connect_four.create_new_game
    @game = @connect_four.game
    @valid_columns = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
    @game.board.grid['A'] = ['X', 'O', 'X', 'O', 'X', 'O']
    @game.board.grid['B'] = ['.', '.', '.', '.', 'X', 'O']
    @game.board.grid['C'] = ['.', '.', '.', '.', '.', '.']
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

    it 'has a game over attribute that is false by default' do
      expect(@game.game_over).to be false
    end
  end

  describe '#get_computer_selection' do
    xit 'returns a valid column selection' do
      computer_selection = @game.get_computer_selection
      expect(computer_selection).to be_a String
      expect(computer_selection.length).to eq(1)
      expect(@valid_columns).to include(computer_selection)
    end
  end

  describe '#get_human_selection' do
      let(:valid_input) {StringIO.new('B')}

    xit 'returns a valid column selection when input is valid' do
      $stdin = valid_input
      human_selection = @game.get_human_selection
      expect(human_selection).to be_a String
      expect(human_selection.length).to eq(1)
      expect(@valid_columns).to include(human_selection)
      $stdin = STDIN
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
    it 'returns true if the column has open space available' do
      expect(@game.open_column?('B')).to be true
      expect(@game.open_column?('C')).to be true
    end

    it 'returns false if the column is full' do
      expect(@game.open_column?('A')).to be false
    end
  end

  describe '#print_request_selection' do
    it 'returns a prompt to enter selection' do
      expect(@game.print_request_selection).to eq("Select a column! Enter A, B, C, D, E, F, or G.")
    end
  end

  describe '#print_open_column_error' do
    it 'returns an error if column selected is full' do
      expect(@game.print_open_column_error).to eq("Sorry, this column is full. Please try again.")
    end
  end

  describe '#print_valid_letter_error' do
    it 'returns an error if selection is invalid' do
      expect(@game.print_valid_letter_error).to eq("Invalid selection.")
    end
  end
end
