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

  # def print_board
  #   puts format_board
  # end

  def format_board
    formatted_board = @grid.values.transpose
    formatted_board.unshift(@grid.keys).map {|row| row.join}
  end

  def update_board(player_selection, player_type)
    player_type == :human ? piece = 'X' : piece = 'O'
    @grid[player_selection][@grid[player_selection].rindex('.')] = piece
  end

  def check_for_end_game
    vertical = @grid.values
    horizontal = @grid.values.transpose
    diagonal = create_diagonals
    result = :keep_playing
    result = :win if check_for_win(vertical, horizontal, diagonal) == true
    result = :loss if check_for_loss(vertical, horizontal, diagonal) == true
    result = :draw if check_for_draw == true
    result
  end

  def check_for_win(vertical, horizontal, diagonal)
    [vertical, horizontal, diagonal].each do |grid|
      grid.each do |values|
        values.each_cons(4) do |quad|
          return true if quad == ['X', 'X', 'X', 'X']
        end
      end
    end
  end

  def check_for_loss(vertical, horizontal, diagonal)
    [vertical, horizontal, diagonal].each do |grid|
      grid.each do |values|
        values.each_cons(4) do |quad|
          return true if quad == ['O', 'O', 'O', 'O']
        end
      end
    end
  end

  def check_for_draw
    grid.values.flatten.none?{|element| element == '.'}
  end

  def create_diagonals
    grid = @grid.values
    diagonals = [[grid[0][2], grid[1][3], grid[2][4], grid[3][5]],
      [grid[0][1], grid[1][2], grid[2][3], grid[3][4], grid[4][5]],
      [grid[0][0], grid[1][1], grid[2][2], grid[3][3], grid[4][4], grid[5][5]],
      [grid[1][0], grid[2][1], grid[3][2], grid[4][3], grid[5][4], grid[6][5]],
      [grid[2][0], grid[3][1], grid[4][2], grid[5][3], grid[6][4]],
      [grid[3][0], grid[4][1], grid[5][2], grid[6][3]],
      [grid[0][3], grid[1][2], grid[2][1], grid[3][0]],
      [grid[0][4], grid[1][3], grid[2][2], grid[3][1], grid[4][0]],
      [grid[0][5], grid[1][4], grid[2][3], grid[3][2], grid[4][1], grid[5][0]],
      [grid[1][5], grid[2][4], grid[3][3], grid[4][2], grid[5][1], grid[6][0]],
      [grid[2][5], grid[3][4], grid[4][3], grid[5][2], grid[6][1]],
      [grid[3][5], grid[4][4], grid[5][3], grid[6][2]]]
  end
end
