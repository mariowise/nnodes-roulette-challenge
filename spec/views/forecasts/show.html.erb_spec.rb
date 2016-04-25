require 'rails_helper'

RSpec.describe "forecasts/show", type: :view do
  before(:each) do
    @forecast = assign(:forecast, Forecast.create!(
      :text => "Text",
      :rain => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Text/)
    expect(rendered).to match(/false/)
  end
end
