class Game
  attr_reader :board,
              :human_player,
              :computer_player,
              :game_over

  @@valid_columns = ['A', 'B', 'C', 'D', 'E', 'F', 'G']

  def initialize
    @board = Board.new
    @human_player = Player.new(:human)
    @computer_player = Player.new(:computer)
    @game_over = false
  end

  def get_computer_selection
    selection = @@valid_columns.sample
    until open_column?(selection)
      selection = @@valid_columns.sample
    end
    selection
  end

  def get_human_selection
    print_request_selection
    selection = gets.chomp

    until valid_letter?(selection) && open_column?(selection)
      if valid_letter?(selection) == false
        return print_valid_letter_error #change to puts later?
        selection = gets.chomp
      elsif open_column?(selection) == false
        return print_open_column_error #change to puts later?
        selection = gets.chomp
      end
    end
    selection
  end

  def valid_letter?(selection)
    @@valid_columns.include?(selection)
  end

  def open_column?(selection)
    @board.grid[selection].include?(".")
  end

  def print_request_selection #not currently tested - relies on terminal output
    "Select a column! Enter A, B, C, D, E, F, or G."
  end

  def print_open_column_error #not currently tested - relies on terminal output
    "Sorry, this column is full. Please try again."
  end

  def print_valid_letter_error #not currently tested - relies on terminal output
    "Invalid selection. Please enter A, B, C, D, E, F, or G."
  end
end
