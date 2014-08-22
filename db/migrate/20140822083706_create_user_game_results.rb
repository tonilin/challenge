class CreateUserGameResults < ActiveRecord::Migration
  def change
    create_table :user_game_results do |t|
      t.integer :user_id
      t.integer :game_id
      t.string  :description
      t.string  :image
      t.timestamps
    end
  end
end
