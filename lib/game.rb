class Game
  attr_accessor :game_over

  attr_reader :board,
              :human_player,
              :computer_player

  @@valid_columns = ['A', 'B', 'C', 'D', 'E', 'F', 'G']

  def initialize(board, human_player, computer_player)
    @board = board
    @human_player = human_player
    @computer_player = computer_player
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
    puts print_request_selection
    selection = gets.chomp.upcase

    until valid_letter?(selection) && open_column?(selection)
      if valid_letter?(selection) == false
        puts print_valid_letter_error
        selection = gets.chomp.upcase
      elsif open_column?(selection) == false
        puts print_open_column_error
        selection = gets.chomp.upcase
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

  def print_request_selection
    "Select a column! Enter A, B, C, D, E, F, or G."
  end

  def print_open_column_error
    "Sorry, this column is full. Please try again."
  end

  def print_valid_letter_error
    "Invalid selection. Please enter A, B, C, D, E, F, or G."
  end
end
