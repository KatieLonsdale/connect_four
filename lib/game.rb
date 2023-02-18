class Game
  attr_reader :board,
              :human_player,
              :computer_player

  def initialize
    @board = Board.new
    @human_player = Player.new(:human)
    @computer_player = Player.new(:computer)
  end

  def get_computer_selection
    valid_columns = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
    selection = valid_columns.sample
    until open_column?(selection)
      selection = valid_columns.sample
    end
    selection
  end

  #get human selection

  #valid_letter?(selection)
    #has to check if the column is inside the range A-G

  def open_column?(selection)
    @board.grid[selection].include?(".")
  end

end
