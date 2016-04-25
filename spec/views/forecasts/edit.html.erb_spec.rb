require 'rails_helper'

RSpec.describe "forecasts/edit", type: :view do
  before(:each) do
    @forecast = assign(:forecast, Forecast.create!(
      :text => "MyString",
      :rain => false
    ))
  end

  it "renders the edit forecast form" do
    render

    assert_select "form[action=?][method=?]", forecast_path(@forecast), "post" do

      assert_select "input#forecast_text[name=?]", "forecast[text]"

      assert_select "input#forecast_rain[name=?]", "forecast[rain]"
    end
  end
end
