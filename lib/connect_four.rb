class ConnectFour
  attr_accessor :current_player,
                :connection

  attr_reader :human_player,
              :computer_player,
              :board,
              :game

  def initialize(connection, server)
    @human_player = nil
    @computer_player = nil
    @board = nil
    @game = nil
    @current_player = nil
    @connection = connection
    @server = server
    @status = "http/1.1 200 ok"

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
    @game = Game.new(@board, @human_player, @computer_player, @server, @connection)
  end

  def show_welcome_message
    "<html>Welcome to Connect Four!<br></html>"
  end

  def show_main_menu
    "<html> Enter p to play or q to quit.<br></html>"
  end

  def show_play_again_message
    'Want to play again?'
  end

  def show_goodbye_message
    'Thanks for playing. Goodbye!'
  end

  def turn_results(result)
    if result == :win
      @game.game_over = true
      'You win!'
    elsif result == :loss
      @game.game_over = true
      'You lose!'
    elsif result == :draw
      @game.game_over = true
      'Game is a draw!'
    end
  end

  def start
    response = @status + "\r\n" + "\r\n" + show_welcome_message + show_main_menu
    @connection.puts response
    play_or_quit
  end

  def play
    create_new_game
    set_current_player if current_player.is_computer?
    # sleep(0.5)
    play_board = @board.format_board
    # break = "<html>"
    response = "\r\n" + "\r\n" + play_board
    @connection.puts response
    # sleep(0.5)

    until @game.game_over == true
      case current_player.type
      when :human
        @board.update_board(@game.get_human_selection, @current_player)
      when :computer
        @board.update_board(@game.get_computer_selection, @current_player)
      end

      # sleep(0.7)
      # puts @board.format_board
      play_board = @board.format_board
      response = "\r\n" + "\r\n" + play_board
      @connection = @game.connection
      @connection.puts response
      # sleep(0.5)
      puts turn_results(@board.check_for_end_game)
      set_current_player
    end

    puts show_play_again_message
    puts show_main_menu
    play_or_quit
  end

  def play_or_quit
    puts 'sending request'
    # selection = gets.chomp.downcase
    puts "Got this Request:"
    request_lines = []
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
      selection = params[-1].downcase
    end

    until selection == 'p' || selection == 'q'
      puts 'Invalid choice. Type p or q to continue.'
      selection = gets.chomp.downcase
    end

    if selection == 'p'
      play
    elsif selection == 'q'
      puts show_goodbye_message
    end
  end
end
