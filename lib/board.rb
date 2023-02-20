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
    vertical = @grid.values
    horizontal = @grid.values.transpose
    result = :keep_playing
    result = :win if check_for_win(vertical, horizontal) == true
    result = :loss if check_for_loss(vertical, horizontal) == true
    result = :draw if check_for_draw == true
    result
  end

  def check_for_win(vertical, horizontal)
    [vertical, horizontal].each do |grid|
      grid.each do |values|
        values.each_cons(4) do |quad|
          return true if quad == ['X', 'X', 'X', 'X']
        end
      end
    end
  end

  def check_for_loss(vertical, horizontal)
    [vertical, horizontal].each do |grid|
      grid.each do |values|
        values.each_cons(4) do |quad|
          return true if quad == ['O', 'O', 'O', 'O']
        end
      end
    end
  end

  def check_for_draw
    grid.values.each do |values|
      return true if values.none?{|element| element == '.'}
    end
  end
end
