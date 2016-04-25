require 'rails_helper'

RSpec.describe Bet, type: :model do
  it "is builded with target and player_id" do
  	p = Player.create name: "Ross"
  	game = Game.new
  	bet = game.bets.build(player: p)
  	expect(bet.player_id).to be p.id
  	expect(bet.player).to_not be nil
  	expect(["Verde", "Rojo", "Negro", "Ninguno"]).to include(bet.target)
  end	
end
