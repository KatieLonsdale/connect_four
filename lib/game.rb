class Game
  attr_reader :board,
              :human_player,
              :computer_player

  def initialize
    @board = Board.new
    @human_player = Player.new(:human)
    @computer_player = Player.new(:computer)
  end
end
