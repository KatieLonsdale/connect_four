class Game
  attr_reader :board,
              :human_player,
              :computer_player

  @@valid_columns = ['A', 'B', 'C', 'D', 'E', 'F', 'G']

  def initialize
    @board = Board.new
    @human_player = Player.new(:human)
    @computer_player = Player.new(:computer)
  end

  def get_computer_selection
    selection = @@valid_columns.sample
    until open_column?(selection)
      selection = @@valid_columns.sample
    end
    selection
  end

  def get_human_selection
    # puts "Select a column! Enter A, B, C, D, E, F, or G."
    # selection = "A"

    # until valid_letter?(selection) && open_column?(selection)
    #   if open_column?(selection) == false
    #     return "Sorry, this column is full. Please try again."
    #   elsif
    #     return "Invalid selection. Please enter A, B, C, D, E, F, or G."
    #   end
    #   #selection = gets.chomp
    # end
    # selection
  end

  def valid_letter?(selection)
    @@valid_columns.include?(selection)
  end

  def open_column?(selection)
    @board.grid[selection].include?(".")
  end

end
