class Game
  attr_accessor :game_over

  attr_reader :board,
              :human_player,
              :computer_player,
              :connection

  VALID_COLUMNS = ['A', 'B', 'C', 'D', 'E', 'F', 'G']

  def initialize(board, human_player, computer_player, server, connection)
    @board = board
    @human_player = human_player
    @computer_player = computer_player
    @game_over = false
    @server = server
    @connection = connection
    @status = "http/1.1 200 ok"
  end

  def get_computer_selection
    message = "<html>Computer - take your turn.<br></html>"
    selection = VALID_COLUMNS.sample
    until open_column?(selection)
      selection = VALID_COLUMNS.sample
    end
    selection
  end

  def get_human_selection
    response = "\r\n" + "\r\n" + print_request_selection
    @connection.puts response
    request_lines = []
    @connection = @server.accept
    line = @connection.gets.chomp
    while !line.empty?
      request_lines << line
      line = @connection.gets.chomp
    end
    puts request_lines
    request_line = request_lines[0]
    if request_line.include? '?'
      path = request_line.split[1]
      params = path.split("selection=")
      selection = params[-1].upcase
    end
    
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
    VALID_COLUMNS.include?(selection)
  end

  def open_column?(selection)
    @board.grid[selection].include?(".")
  end

  def print_request_selection
    "<html>Select a column! Enter A, B, C, D, E, F, or G<br></html>"
  end

  def print_open_column_error
    "<html>Sorry, this column is full. Please try again.<br></html>"
  end

  def print_valid_letter_error
    "<html>Invalid selection.</html>"
  end
end
