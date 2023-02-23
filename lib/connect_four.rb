class ConnectFour
  attr_accessor :current_player, :server

  attr_reader :human_player,
              :computer_player,
              :board,
              :game

  def initialize(server)
    @human_player = nil
    @computer_player = nil
    @board = nil
    @game = nil
    @current_player = nil
    @server = server

    create_players
    set_current_player
  end

  def create_players
    @human_player = Player.new(:human)
    @computer_player = Player.new(:computer)
  end

  def set_current_player
    @current_player == @human_player ? @current_player = @computer_player : @current_player = @human_player
  end

  def create_new_game
    @board = Board.new
    @game = Game.new(@board, @human_player, @computer_player, @server)
  end

  def start(connection)
    welcome = "<html>#{show_welcome_message}<br></html>"
    main_menu = "<html>#{show_main_menu}<br></html>"
    status = "http/1.1 200 ok"
    response = status + "\r\n" + "\r\n" + welcome + "\n" + main_menu
    connection.puts response
  end

  def play_or_quit(connection)
    selection = parse_selection(connection)

    until selection == 'p' || selection == 'q'
        output = "<html>Invalid choice. Type p or q to continue.</html>"
        status = "http/1.1 200 ok"
        response = "\r\n" + "\r\n" + output
        connection.puts response
        selection = parse_selection(connection)
    end

    if selection == 'p'
      output = "<html>Ok let's play!<br></html>"
    elsif selection.downcase == 'q'
      output = "<html>Goodbye.<br></html>"
    end

    status = "http/1.1 200 ok"
    response = "\r\n" + "\r\n" + output
    connection.puts response

    selection
  end

  def play(connection)
    create_new_game
    set_current_player if current_player.is_computer?

    status = "http/1.1 200 ok"
    response = "\r\n" + "\r\n" + "#{@board.format_board}"
    connection.puts response

    until @game.game_over == true
      case current_player.type
      when :human
        @board.update_board(@game.get_human_selection(connection), @current_player)
      when :computer
        @board.update_board(@game.get_computer_selection(connection), @current_player)
      end

      status = "http/1.1 200 ok"
      response = "\r\n" + "\r\n" + "#{@board.format_board}"
      connection.puts response

      output = "<html>#{turn_results(@board.check_for_end_game)}<br></html>"
      status = "http/1.1 200 ok"
      response = "\r\n" + "\r\n" + output
      connection.puts response

      set_current_player
    end

    play_again_message = "<html>#{show_play_again_message}<br></html>"
    main_menu = "<html>#{show_main_menu}<br></html>"
    status = "http/1.1 200 ok"
    response = "\r\n" + "\r\n" + play_again_message + "\n" + main_menu
    connection.puts response

    play_or_quit(connection)
  end

  def turn_results(result)
    if result == :win
      @game.game_over = true
      output = 'You win!'
    elsif result == :loss
      @game.game_over = true
      output = 'You lose!'
    elsif result == :draw
      @game.game_over = true
      output = 'Game is a draw!'
    end
    output
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
      selection = params[-1].downcase
    end
    selection
  end

  def show_welcome_message
    'Welcome to Connect Four!'
  end

  def show_main_menu
    'Enter p to play or q to quit.'
  end

  def show_play_again_message
    'Want to play again?'
  end

  def show_goodbye_message
    'Thanks for playing. Goodbye!'
  end
end