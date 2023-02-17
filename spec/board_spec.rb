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

    it 'board is blank by default' do
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
end
