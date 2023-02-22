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
    puts "Computer - take your turn."
    selection = @@valid_columns.sample
    until open_column?(selection)
      selection = @@valid_columns.sample
    end
    selection
  end

  def get_human_selection
    puts print_request_selection
    selection = gets.chomp.upcase
    if !valid_letter?(selection)
      puts print_valid_letter_error
      get_human_selection
    elsif !open_column?(selection)
      puts print_open_column_error
      get_human_selection
    else
      selection
    end
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
    "Invalid selection."
  end
end
