class Game
  attr_accessor :game_over, :server

  attr_reader :board,
              :human_player,
              :computer_player

  VALID_COLUMNS = ['A', 'B', 'C', 'D', 'E', 'F', 'G']

  def initialize(board, human_player, computer_player, server)
    @board = board
    @human_player = human_player
    @computer_player = computer_player
    @game_over = false
    @server = server
  end

  def get_computer_selection(connection)
    selection = VALID_COLUMNS.sample
    until open_column?(selection)
      selection = VALID_COLUMNS.sample
    end

    computer_choice = "<html>The computer chose #{selection}.<br></html>"
    status = "http/1.1 200 ok"
    response = "\r\n" + "\r\n" + computer_choice
    connection.puts response

    selection
  end

  def get_human_selection(connection)
    request_selection = "<html>#{print_request_selection}<br></html>"
    status = "http/1.1 200 ok"
    response = "\r\n" + "\r\n" + request_selection
    connection.puts response

    connection = @server.accept

    selection = parse_selection(connection).to_s
    if !valid_letter?(selection)
      valid_letter_error = "<html>#{print_valid_letter_error}<br></html>"
      status = "http/1.1 200 ok"
      response = status + "\r\n" + "\r\n" + valid_letter_error
      connection.puts response

      connection = @server.accept
      get_human_selection(connection)
    elsif !open_column?(selection)
      open_column_error = "<html>#{print_open_column_error}<br></html>"
      status = "http/1.1 200 ok"
      response = status + "\r\n" + "\r\n" + open_column_error
      connection.puts response

      connection = @server.accept
      get_human_selection(connection)
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
    "Select a column! Enter A, B, C, D, E, F, or G."
  end

  def print_open_column_error
    "Sorry, this column is full. Please try again."
  end

  def print_valid_letter_error
    "Invalid selection."
  end

  def parse_selection(connection)
    request_lines = []
    line = connection.gets.chomp
    while !line.empty?
      request_lines << line
      line = connection.gets.chomp
    end

    request_line = request_lines[0]
    if request_line.include? '?'
      path = request_line.split[1]
      params = path.split("selection=")
      selection = params[-1]
    end
    selection
  end
end
