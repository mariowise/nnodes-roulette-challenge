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
end
