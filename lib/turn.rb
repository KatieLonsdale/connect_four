class Turn
  attr_reader :player_selection,
              :computer_selection

  def initialize(player_selection, computer_selection)
    @player_selection = player_selection
    @computer_selection = computer_selection
  end
end