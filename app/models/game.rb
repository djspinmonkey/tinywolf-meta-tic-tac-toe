class Game
  attr_accessor :board, :current_player

  def initialize
    @board = Board.new
    @current_player = 'X'
  end

  def winner
    board.three_in_a_row?
  end

  def over?
    !!winner or @board.full?
  end

  def play(x, y)
    @board[x,y] = @current_player
    @current_player = (@current_player == 'X') ? 'O' : 'X'
  end
end
