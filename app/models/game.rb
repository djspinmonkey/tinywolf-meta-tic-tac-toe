class Game
  attr_accessor :board

  def initialize
    @board = Board.new
  end

  def winner
    board.three_in_a_row?
  end
end
