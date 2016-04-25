require 'rails_helper'

RSpec.describe "forecasts/index", type: :view do
  before(:each) do
    assign(:forecasts, [
      Forecast.create!(
        :text => "Text",
        :rain => false
      ),
      Forecast.create!(
        :text => "Text",
        :rain => false
      )
    ])
  end

  it "renders a list of forecasts" do
    render
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
