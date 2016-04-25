class Bet < ActiveRecord::Base
  
  def initialize(args = {})
  	args[:target] ||= Game.spin()
  	super(args)
  end

  belongs_to :game
  belongs_to :player

  def get_code
    "B-#{id.to_s.rjust(5, '0')}"
  end

  def player
    Player.with_deleted.find(self.player_id)
  end
end
