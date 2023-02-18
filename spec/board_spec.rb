require 'spec_helper'

describe Board do
  before(:each) do
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
end
