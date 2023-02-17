class Board
  attr_reader :header,
              :rows,
              :columns,
              :grid

  def initialize()
    @header = ["A", "B", "C", "D", "E", "F", "G"]
    @rows = 6
    @columns = 7
    @grid = make_grid
  end

  def make_grid
    Array.new(@rows, Array.new(@columns, "."))
  end

end
