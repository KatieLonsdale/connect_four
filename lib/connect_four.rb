class ConnectFour
  attr_reader :board,
              :human_player,
              :computer_player

  def initialize
    @board = nil
    @human_player = nil
    @computer_player = nil

    create_instances
  end

  def create_instances
    @board = Board.new
    @human_player = Player.new(:human)
    @computer_player = Player.new(:computer)
  end
end
