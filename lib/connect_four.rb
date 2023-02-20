class ConnectFour
  attr_reader :human_player,
              :computer_player,
              :board,
              :game

  def initialize
    @human_player = nil
    @computer_player = nil
    @board = nil
    @game = nil

    create_players
  end

  def create_players
    @human_player = Player.new(:human)
    @computer_player = Player.new(:computer)
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
    selection = gets.chomp

    until selection == 'p' || selection == 'q'
      puts 'Invalid choice. Type p or q to continue.'
      selection = gets.chomp
    end

    if selection == 'p'
      play
    elsif selection == 'q'
      puts show_goodbye_message
    end
  end
end
