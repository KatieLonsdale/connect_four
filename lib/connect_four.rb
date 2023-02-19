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
end
