class Board
  attr_reader :header,
              :rows,
              :columns,
              :grid

  def initialize
    @rows = 6
    @columns = 7
    @grid = make_grid
  end

  def make_grid
    header = ["A", "B", "C", "D", "E", "F", "G"]
    grid = Hash.new {|grid, letter| grid[letter] = [".", ".", ".", ".", ".", "."]}
    header.map do |letter|
      grid[letter]
    end
    grid
  end

  def print_board
    puts format_board
  end

  def format_board
    formatted_board = @grid.values.transpose
    formatted_board.unshift(@grid.keys).map {|row| row.join}
  end
end
