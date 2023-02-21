require 'spec_helper'

describe Board do
  before(:each) do
    @connect_four = ConnectFour.new
    @board = Board.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@board).to be_a Board
    end

    it 'has a grid' do
      expect(@board.grid).to be_a Hash
      expect(@board.grid.keys).to eq(["A", "B", "C", "D", "E", "F", "G"])
      expect(@board.grid.values.count).to eq(7)
    end

    it 'board is blank by default' do
      expect(@board.grid.values.sample).to eq([".", ".", ".", ".", ".", "."])
    end

    it 'has a row count of 6 by default' do
      expect(@board.rows).to eq(6)
    end

    it 'has a column count of 7 by default' do
      expect(@board.columns).to eq(7)
    end
  end

  describe '#make_grid' do
    it 'has 6 subarrays of 7 elements each by default' do
      expect(@board.grid.values.sample.count).to eq(@board.rows)
      expect(@board.grid.keys.count).to eq(@board.columns)
    end
  end

  describe '#format_board' do
    it 'can format subarrays to strings' do
      expect(@board.format_board).to be_a Array
      expect(@board.format_board.count).to eq(@board.rows + 1)
      expect(@board.format_board.sample[0]).to be_a String
      expect(@board.format_board[0]).to eq(@board.grid.keys.join)
      expect(@board.format_board.sample.length).to eq(@board.columns)
    end
  end

  describe '#update_board' do
    it 'changes grid to reflect board after human selections' do
      @board.update_board('A', @connect_four.current_player)

      expect(@board.grid).to eq({"A"=>[".", ".", ".", ".", ".", "X"],
      "B"=>[".", ".", ".", ".", ".", "."],
      "C"=>[".", ".", ".", ".", ".", "."],
      "D"=>[".", ".", ".", ".", ".", "."],
      "E"=>[".", ".", ".", ".", ".", "."],
      "F"=>[".", ".", ".", ".", ".", "."],
      "G"=>[".", ".", ".", ".", ".", "."]})

      @board.update_board('C', @connect_four.current_player)

      expect(@board.grid).to eq({"A"=>[".", ".", ".", ".", ".", "X"],
      "B"=>[".", ".", ".", ".", ".", "."],
      "C"=>[".", ".", ".", ".", ".", "X"],
      "D"=>[".", ".", ".", ".", ".", "."],
      "E"=>[".", ".", ".", ".", ".", "."],
      "F"=>[".", ".", ".", ".", ".", "."],
      "G"=>[".", ".", ".", ".", ".", "."]})

      @board.update_board('D', @connect_four.current_player)

      expect(@board.grid).to eq({"A"=>[".", ".", ".", ".", ".", "X"],
      "B"=>[".", ".", ".", ".", ".", "."],
      "C"=>[".", ".", ".", ".", ".", "X"],
      "D"=>[".", ".", ".", ".", ".", "X"],
      "E"=>[".", ".", ".", ".", ".", "."],
      "F"=>[".", ".", ".", ".", ".", "."],
      "G"=>[".", ".", ".", ".", ".", "."]})

      @board.update_board('A', @connect_four.current_player)

      expect(@board.grid).to eq({"A"=>[".", ".", ".", ".", "X", "X"],
      "B"=>[".", ".", ".", ".", ".", "."],
      "C"=>[".", ".", ".", ".", ".", "X"],
      "D"=>[".", ".", ".", ".", ".", "X"],
      "E"=>[".", ".", ".", ".", ".", "."],
      "F"=>[".", ".", ".", ".", ".", "."],
      "G"=>[".", ".", ".", ".", ".", "."]})
    end

    it 'changes grid to reflect board after computer selections' do
      @connect_four.set_current_player
      @board.update_board('B', @connect_four.current_player)

      expect(@board.grid).to eq({"A"=>[".", ".", ".", ".", ".", "."],
      "B"=>[".", ".", ".", ".", ".", "O"],
      "C"=>[".", ".", ".", ".", ".", "."],
      "D"=>[".", ".", ".", ".", ".", "."],
      "E"=>[".", ".", ".", ".", ".", "."],
      "F"=>[".", ".", ".", ".", ".", "."],
      "G"=>[".", ".", ".", ".", ".", "."]})

      @board.update_board('E', @connect_four.current_player)

      expect(@board.grid).to eq({"A"=>[".", ".", ".", ".", ".", "."],
      "B"=>[".", ".", ".", ".", ".", "O"],
      "C"=>[".", ".", ".", ".", ".", "."],
      "D"=>[".", ".", ".", ".", ".", "."],
      "E"=>[".", ".", ".", ".", ".", "O"],
      "F"=>[".", ".", ".", ".", ".", "."],
      "G"=>[".", ".", ".", ".", ".", "."]})

      @board.update_board('G', @connect_four.current_player)

      expect(@board.grid).to eq({"A"=>[".", ".", ".", ".", ".", "."],
      "B"=>[".", ".", ".", ".", ".", "O"],
      "C"=>[".", ".", ".", ".", ".", "."],
      "D"=>[".", ".", ".", ".", ".", "."],
      "E"=>[".", ".", ".", ".", ".", "O"],
      "F"=>[".", ".", ".", ".", ".", "."],
      "G"=>[".", ".", ".", ".", ".", "O"]})

      @board.update_board('B', @connect_four.current_player)

      expect(@board.grid).to eq({"A"=>[".", ".", ".", ".", ".", "."],
      "B"=>[".", ".", ".", ".", "O", "O"],
      "C"=>[".", ".", ".", ".", ".", "."],
      "D"=>[".", ".", ".", ".", ".", "."],
      "E"=>[".", ".", ".", ".", ".", "O"],
      "F"=>[".", ".", ".", ".", ".", "."],
      "G"=>[".", ".", ".", ".", ".", "O"]})
    end
end

  describe '#check_for_end_game' do
    it 'checks for four in a row horizontally' do
      @board.grid = {"A"=>[".", ".", ".", ".", ".", "X"],
      "B"=>[".", ".", ".", ".", ".", "O"],
      "C"=>[".", ".", ".", ".", ".", "X"],
      "D"=>[".", ".", ".", ".", ".", "X"],
      "E"=>[".", ".", ".", ".", ".", "X"],
      "F"=>[".", ".", ".", ".", ".", "X"],
      "G"=>[".", ".", ".", ".", ".", "."]}

      expect(@board.check_for_end_game).to eq(:win)

      @board.grid = {"A"=>[".", ".", ".", ".", ".", "X"],
      "B"=>[".", ".", ".", ".", ".", "O"],
      "C"=>[".", ".", ".", ".", ".", "O"],
      "D"=>[".", ".", ".", ".", ".", "O"],
      "E"=>[".", ".", ".", ".", ".", "O"],
      "F"=>[".", ".", ".", ".", ".", "."],
      "G"=>[".", ".", ".", ".", ".", "."]}

      expect(@board.check_for_end_game).to eq(:loss)
    end

    it 'checks for four in a row vertically' do
      @board.grid = {"A"=>[".", ".", ".", ".", ".", "X"],
      "B"=>[".", ".", ".", ".", ".", "O"],
      "C"=>[".", ".", ".", ".", ".", "."],
      "D"=>[".", ".", ".", ".", ".", "."],
      "E"=>[".", ".", ".", ".", ".", "."],
      "F"=>[".", ".", "X", "X", "X", "X"],
      "G"=>[".", ".", ".", ".", ".", "."]}

      expect(@board.check_for_end_game).to eq(:win)

      @board.grid = {"A"=>[".", ".", ".", ".", ".", "X"],
      "B"=>[".", ".", "O", "O", "O", "O"],
      "C"=>[".", ".", ".", ".", ".", "."],
      "D"=>[".", ".", ".", ".", ".", "."],
      "E"=>[".", ".", ".", ".", ".", "."],
      "F"=>[".", ".", ".", ".", ".", "."],
      "G"=>[".", ".", ".", ".", ".", "."]}

      expect(@board.check_for_end_game).to eq(:loss)
    end

    it 'checks for four in a row diagonally' do
      @board.grid = {"A"=>[".", ".", ".", ".", ".", "."],
      "B"=>[".", ".", ".", ".", ".", "."],
      "C"=>[".", ".", "X", "O", "O", "X"],
      "D"=>[".", ".", ".", "X", "O", "O"],
      "E"=>[".", ".", ".", ".", "X", "X"],
      "F"=>[".", ".", ".", ".", ".", "X"],
      "G"=>[".", ".", ".", ".", ".", "."]}

      expect(@board.check_for_end_game).to eq(:win)

      @board.grid = {"A"=>[".", ".", ".", ".", ".", "."],
      "B"=>[".", ".", ".", ".", ".", "O"],
      "C"=>[".", ".", ".", ".", "O", "O"],
      "D"=>[".", ".", ".", "O", "X", "O"],
      "E"=>[".", ".", "O", "X", "X", "X"],
      "F"=>[".", ".", ".", ".", ".", "."],
      "G"=>[".", ".", ".", ".", ".", "."]}

      expect(@board.check_for_end_game).to eq(:loss)
    end

    it 'checks for a draw' do
      @board.grid = {"A"=>["X", "O", "X", "X", "O", "X"],
      "B"=>["O", "X", "O", "X", "X", "O"],
      "C"=>["X", "X", "O", "X", "O", "X"],
      "D"=>["O", "X", "O", "O", "X", "O"],
      "E"=>["X", "O", "X", "O", "X", "X"],
      "F"=>["O", "X", "X", "O", "X", "O"],
      "G"=>["X", "O", "X", "X", "O", "X"]}

      expect(@board.check_for_end_game).to eq(:draw)
    end

    it 'does nothing if no end game condition is met' do
      @board.grid = {"A"=>[".", ".", ".", ".", ".", "X"],
      "B"=>[".", ".", "O", "O", "X", "O"],
      "C"=>[".", ".", ".", ".", ".", "."],
      "D"=>[".", ".", ".", ".", ".", "X"],
      "E"=>[".", ".", ".", ".", "O", "."],
      "F"=>[".", ".", ".", ".", ".", "."],
      "G"=>[".", ".", ".", ".", ".", "X"]}

      expect(@board.check_for_end_game).to eq(:keep_playing)
    end
  end

  describe '#check_for_win' do
    before(:each) do
      @no_win = [[".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", "."]]
    end

    it 'checks for human player win' do
      horizontal = [[".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      ["X", "O", "X", "X", "X", "X", "."]]

      vertical = [[".", ".", ".", ".", ".", "X"],
      [".", ".", ".", ".", ".", "O"],
      [".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", "."],
      [".", ".", "X", "X", "X", "X"],
      [".", ".", ".", ".", ".", "."]]

      diagonal = [[".", ".", "O", "O"],
      [".", ".", "O", "O", "X"],
      [".", ".", "X", "X", "X", "X"],
      [".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", "."],
      [".", ".", ".", "."],
      [".", ".", ".", "."],
      [".", ".", "X", ".", "."],
      [".", ".", "O", ".", ".", "."],
      [".", "O", "X", ".", ".", "."],
      ["X", "O", ".", ".", "."],
      ["O", "X", ".", "."]]

      expect(@board.check_for_win(vertical, @no_win, @no_win)).to be true
      expect(@board.check_for_win(@no_win, horizontal, @no_win)).to be true
      expect(@board.check_for_win(@no_win, @no_win, diagonal)).to be true
    end

    it 'does nothing if no win is found' do
      expect(@board.check_for_win(@no_win, @no_win, @no_win)).to_not be true
    end
  end

  describe '#check_for_loss' do
    before(:each) do
      @no_win = [[".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", "."]]
    end

    it 'checks for computer player win' do
      horizontal = [[".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      ["O", "X", "O", "O", "O", "O", "."]]

      vertical = [[".", ".", ".", ".", ".", "O"],
      [".", ".", ".", ".", ".", "X"],
      [".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", "."],
      [".", ".", "O", "O", "O", "O"],
      [".", ".", ".", ".", ".", "."]]

      diagonal = [[".", ".", "X", "X"],
      [".", ".", "X", "X", "O"],
      [".", ".", "O", "O", "O", "O"],
      [".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", "."],
      [".", ".", ".", "."],
      [".", ".", ".", "."],
      [".", ".", "O", ".", "."],
      [".", ".", "X", ".", ".", "."],
      [".", "X", "O", ".", ".", "."],
      ["O", "X", ".", ".", "."],
      ["X", "O", ".", "."]]

      expect(@board.check_for_loss(vertical, @no_win, @no_win)).to be true
      expect(@board.check_for_loss(@no_win, horizontal, @no_win)).to be true
      expect(@board.check_for_loss(@no_win, @no_win, diagonal)).to be true
    end

    it 'does nothing if no loss is found' do
      expect(@board.check_for_win(@no_win, @no_win, @no_win)).to_not be true
    end
  end

  describe '#check_for_draw' do
    it 'checks for a full board with no win' do
      @board.grid = {"A"=>["X", "O", "X", "X", "O", "X"],
      "B"=>["O", "X", "O", "X", "X", "O"],
      "C"=>["X", "X", "O", "X", "O", "X"],
      "D"=>["O", "X", "O", "O", "X", "O"],
      "E"=>["X", "O", "X", "O", "X", "X"],
      "F"=>["O", "X", "X", "O", "X", "O"],
      "G"=>["X", "O", "X", "X", "O", "X"]}

      expect(@board.check_for_draw).to be true

      @board.grid = {"A"=>[".", "O", "X", "X", "O", "X"],
      "B"=>[".", ".", "O", "X", "X", "O"],
      "C"=>[".", ".", "O", "X", "O", "X"],
      "D"=>[".", "X", "O", "O", "X", "O"],
      "E"=>["X", "O", "X", "O", "X", "X"],
      "F"=>["O", "X", "X", "O", "X", "O"],
      "G"=>["X", "O", "X", "X", "O", "X"]}

      expect(@board.check_for_draw).to be false
    end
  end

  describe '#create_diagonals' do
    it 'returns an array of all diagonals on the grid' do
      @board.grid = ({"A"=>[".", ".", "O", ".", ".", "X"],
      "B"=>[".", ".", ".", "O", "X", "."],
      "C"=>[".", ".", ".", ".", "O", "X"],
      "D"=>[".", ".", ".", ".", "X", "O"],
      "E"=>[".", ".", ".", ".", ".", "."],
      "F"=>[".", ".", ".", ".", ".", "."],
      "G"=>[".", ".", ".", ".", ".", "."]})

      expect(@board.create_diagonals).to be_a Array
      expect(@board.create_diagonals.count).to eq(12)
      expect(@board.create_diagonals.sample).to be_a Array
      expect(@board.create_diagonals.flatten).to include(@board.grid.values[0][0])
      expect(@board.create_diagonals.flatten).to include(@board.grid.values[0][5])
      expect(@board.create_diagonals.flatten).to include(@board.grid.values[6][0])
      expect(@board.create_diagonals.flatten).to include(@board.grid.values[6][5])
      expect(@board.create_diagonals[0]).to eq(["O","O","O","O"])
    end
  end
end
