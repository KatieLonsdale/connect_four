class Player
  attr_reader :type,
              :piece

  def initialize(type)
    @type = type
    @piece = assign_piece
  end

  def assign_piece
    @type == :human ? @piece = 'X' : @piece = 'O'
  end
end