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
end
