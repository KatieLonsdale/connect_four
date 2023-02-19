class Board
  attr_reader :rows,
              :columns
  attr_accessor :grid

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
    @grid = grid
  end

  def print_board
    puts format_board
  end

  def format_board
    formatted_board = @grid.values.transpose
    formatted_board.unshift(@grid.keys).map {|row| row.join}
  end

  def update_board(player_selection, computer_selection)
    @grid[player_selection][@grid[player_selection].rindex('.')] = 'X'
    @grid[computer_selection][@grid[computer_selection].rindex('.')] = 'O'
  end

  def check_for_end_game
    values = grid.values
    array = []
    values.each do |subarray|
      subarray.each_cons(4){|element| array << element}
    end
    if array.any?{|subarray| subarray.all?{|element| element == 'X'}}
      :win
    elsif array.any?{|subarray| subarray.all?{|element| element == 'O'}}
      :loss
    end
  end
end
