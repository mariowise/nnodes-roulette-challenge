class AddRainToForecast < ActiveRecord::Migration
  def change
    add_column :forecasts, :rain, :boolean, default: false
  end
end
