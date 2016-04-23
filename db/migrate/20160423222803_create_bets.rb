class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.references :game, index: true, foreign_key: true
      t.references :player, index: true, foreign_key: true
      t.integer :amount
      t.string :level

      t.timestamps null: false
    end
  end
end
