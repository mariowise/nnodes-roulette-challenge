class AddMissingColumnsToGame < ActiveRecord::Migration
  def change
  	add_column :games, :result, :string
  	add_column :bets, :target, :string
  end
end
