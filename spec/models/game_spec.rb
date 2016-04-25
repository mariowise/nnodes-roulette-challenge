require 'rails_helper'

RSpec.describe Game do
	it "is created with result" do 
		game = Game.new
		expect(game.result).to_not be nil
		expect(game.result).to_not be ""
		expect(["Verde", "Rojo", "Negro", "Ninguno"]).to include(game.result)
	end

	it "is created with all players participating" do 
  	p1 = Player.create name: "Monica"
  	p2 = Player.create name: "Chandler"
  	game = Game.create()
  	players = game.players.pluck :name
  	expect(players).to include("Monica")
  	expect(players).to include("Chandler")
  	expect(players.size).to be 2
  end

  it "players with $1.000 or less bet AllIn" do 
  	p1 = Player.create name: "Player 1"
  	p2 = Player.create name: "Player 2", balance: 1000
  	p3 = Player.create name: "Player 3", balance: 999
  	game = Game.create()

  	bet1 = game.bets.where(player: p1).take
  	bet2 = game.bets.where(player: p2).take
  	bet3 = game.bets.where(player: p3).take

  	expect(bet1.amount).to be < 10000 unless bet1.target == "Ninguno"
  	expect(bet2.amount).to be 1000 		unless bet2.target == "Ninguno"
  	expect(bet3.amount).to be 999 		unless bet3.target == "Ninguno"
  end

  it "winners win 15 times their bet if they hit 'Verde'" do
  	p = Player.create name: "Player 1"
  	greenHit = false
  	while !greenHit
  		game = Game.create()
  		bet = game.bets.where(player: p).take
  		if bet.target == "Verde" && bet.target == game.result
  			p = Player.find p.id
  			expect(p.balance).to eq(10000 + bet.amount * 14)
  			greenHit = true
  		end
  		p = Player.find p.id
  		p.balance = 10000
  		p.save
  		game.destroy
  	end
  end

  it "winners win 2 times their bet if they hit 'Negro' or 'Rojo'" do 
  	p = Player.create name: "Player 1"
  	redBlackHit = false
  	while !redBlackHit
  		game = Game.create()
  		bet = game.bets.where(player: p).take
  		if (bet.target == "Negro" || bet.target == "Rojo") && bet.target == game.result
  			p = Player.find p.id
  			expect(p.balance).to eq(10000 + bet.amount)
  			redBlackHit = true
  		end
  		p = Player.find p.id
  		p.balance = 10000
  		p.save
  		game.destroy
  	end
  end
end
