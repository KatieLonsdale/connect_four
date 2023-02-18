require 'spec_helper'

describe Board do
  before(:each) do
    @board = Board.new
  end
  describe '#initialize' do
    xit 'exists' do
      expect(@board).to be_a Board
    end

    it 'has a grid' do
      expect(@board.grid).to be_a Hash
      expect(@board.grid.keys).to eq(["A", "B", "C", "D", "E", "F", "G"])
      expect(@board.grid.values.count).to eq(7)
      expect(@board.grid.values.sample).to eq([".", ".", ".", ".", ".", "."])
    end

    xit 'board is blank by default' do
      expect(@board.grid.all? do |array|
        array.all?{|element| element == "."}
      end).to be true
    end

    # xit 'has a header' do
    #   expect(@board.header).to eq(["A", "B", "C", "D", "E", "F", "G"])
    # end

    xit 'has a row count of 6 by default' do
      expect(@board.rows).to eq(6)
    end

    xit 'has a column count of 7 by default' do
      expect(@board.columns).to eq(7)
    end
  end

  describe '#make_grid' do
    xit 'has 6 subarrays of 7 elements each by default' do
      expect(@board.grid.count).to eq(@board.rows)
      expect(@board.grid.sample.count).to eq(@board.columns)
    end
  end

  describe '#format_board' do
    xit 'can format subarrays to strings' do
      expect(@board.format_board).to be_a Array
      expect(@board.format_board.count).to eq(@board.rows + 1)
      expect(@board.format_board.sample[0]).to be_a String
      expect(@board.format_board[0]).to eq(@board.header.join)
      expect(@board.format_board.sample.length).to eq(@board.columns)
    end
  end
end
