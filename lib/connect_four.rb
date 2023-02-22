class ConnectFour
  attr_accessor :current_player

  attr_reader :human_player,
              :computer_player,
              :board,
              :game

  def initialize
    @human_player = nil
    @computer_player = nil
    @board = nil
    @game = nil
    @current_player = nil

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
    @game = Game.new(@board, @human_player, @computer_player)
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
    puts show_welcome_message
    puts show_main_menu
    play_or_quit
  end

  def play
    create_new_game
    puts @board.format_board

    until @game.game_over == true
      @board.update_board(@game.get_human_selection, @current_player)
      puts @board.format_board

      puts turn_results(@board.check_for_end_game)
      break if @game.game_over == true
      puts "Computer - take your turn."
      set_current_player
      @board.update_board(@game.get_computer_selection, @current_player)
      puts @board.format_board

      puts turn_results(@board.check_for_end_game)
      set_current_player
    end

    puts show_play_again_message
    puts show_main_menu
    play_or_quit
  end

  def play_or_quit
    selection = gets.chomp.downcase

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
