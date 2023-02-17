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
      expect(@board.grid).to be_a Array
    end


    xit 'board is blank by default' do
      expect(@board.grid.all? do |array|
        array.all?{|element| element == "."}
      end).to be true
    end

    it 'has a header' do
      expect(@board.header).to eq(["A", "B", "C", "D", "E", "F", "G"])
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
      expect(@board.grid.count).to eq(@board.rows)
      expect(@board.grid[0].count).to eq(@board.columns)
    end
  end
end
