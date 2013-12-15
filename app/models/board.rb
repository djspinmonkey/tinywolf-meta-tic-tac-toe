class Board
  attr_accessor :positions

  def initialize
    @positions = [[],[],[]]
  end

  def [](x, y)
    raise "Invalid coordinates: [#{x}, #{y}]" unless valid_coords?(x, y)

    positions[x][y]
  end

  def []=(x, y, player)
    raise "Invalid player: #{player}" unless valid_player?(player)
    raise "Invalid coordinates: [#{x}, #{y}]" unless valid_coords?(x, y)
    raise "Position [#{x}, #{y}] already owned by #{ self[x,y] }" if self[x,y]

    positions[x][y] = player
  end

  def three_in_a_row?
    columns = @positions
    rows = (0..2).map {|y| columns.map {|col| col[y] } }
    diags = [
      [self[0,0], self[1,1], self[2,2]],
      [self[0,2], self[1,1], self[2,0]],
    ]
    lines = rows + columns + diags

    lines.each do |line|
      next if line[0].nil?
      return line[0] if line.all? {|i| i == line[0] }
    end

    return nil
  end

  def full?
    positions = [0,1,2].map {|x| [0,1,2].map {|y| self[x,y] } }.flatten
    positions.all? {|pos| !pos.nil? }
  end

  private

  def valid_player?(player)
    (player == 'X') || (player == 'O')
  end

  def valid_coords?(x, y)
    (x >= 0) && (x <= 2) && (y >= 0) && (y <= 2)
  end
end
