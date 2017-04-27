class Message
  attr_reader :type, :message_string

  def initialize(player,type)
    @player = player
    type == :turn ? turn_string : hit_string
  end

  def turn_string
    @message_string = "#{@player.name}\'s turn!"
    @type = :turn
  end

end
