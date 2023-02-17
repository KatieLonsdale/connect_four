class Board
  attr_reader :header,
              :rows,
              :columns

  def initialize()
    @header = ["A", "B", "C", "D", "E", "F", "G"]
    @rows = 6
    @columns = 7
  end
end
