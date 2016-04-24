class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.date :date, index: true
      t.string :text
    end
  end
end
