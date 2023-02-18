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

  def is_computer?
    @type == :computer
  end

  def is_human?
    @type == :human
  end
end