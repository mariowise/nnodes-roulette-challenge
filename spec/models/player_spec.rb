require 'rails_helper'

RSpec.describe Player do
  it "is created with $10.000 by default" do 
  	player = Player.new
  	expect(player.balance).to eq(10000)
  end
end
