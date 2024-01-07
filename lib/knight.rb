class Knight 
  attr_accessor :postion, :valid_turns

  def initialize(position)
    @position = position
    @valid_turns = valid_turns(position)
  end

  private

  def valid_turns(position)
    x = position[0]
    y = position[1]

    [
      [x + 1, y + 2],
      [x - 1, y + 2],
      [x + 1, y - 2],
      [x - 1, y - 2],
      [x + 2, y - 1],
      [x + 2, y + 1],
      [x - 2, y - 1],
      [x - 2, y - 1]
    ]
  end
end
