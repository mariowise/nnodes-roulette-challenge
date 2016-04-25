require 'rails_helper'

RSpec.describe Player do
  it "is created with $10.000 by default" do 
  	player = Player.new
  	expect(player.balance).to eq(10000)
  end

  it "is not valid without a name" do 
  	player = Player.new 
  	expect(player).not_to be_valid
  end

  it "is valid with a name" do 
  	player = Player.new(name: "Mario Luis")
  	expect(player).to be_valid
  end

  it "is not valid with an empty name" do 
  	player = Player.new(name: "")
  	expect(player).not_to be_valid
  end

  it "is not valid with a name too long" do 
  	player = Player.new(name: "a" * 256)
  	expect(player).not_to be_valid
  end

  it "is not valid with a negative balance" do
  	player = Player.new(name: "Mario Casino", balance: -1)
  	expect(player).not_to be_valid
  end

  it "recieves a daily bonus of $10.0000" do
    Player.create([
      { name: "Ross", balance: 999 },
      { name: "Monica", balance: 12000 },
      { name: "Gunter", balance: 1000 }
    ])
    Player.daily_bonus()
    expect(Player.pluck(:balance)[0]).to eq(10999)
    expect(Player.pluck(:balance)[1]).to eq(22000)
    expect(Player.pluck(:balance)[2]).to eq(11000)
  end 
end
