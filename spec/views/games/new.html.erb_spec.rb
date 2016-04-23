require 'rails_helper'

RSpec.describe "games/new", type: :view do
  before(:each) do
    assign(:game, Game.new(
      :id => 1
    ))
  end

  it "renders new game form" do
    render

    assert_select "form[action=?][method=?]", games_path, "post" do

      assert_select "input#game_id[name=?]", "game[id]"
    end
  end
end
