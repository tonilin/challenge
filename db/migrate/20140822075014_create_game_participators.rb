class CreateGameParticipators < ActiveRecord::Migration
  def change
    create_table :game_participators do |t|
      t.integer :user_id
      t.integer :game_id
      t.timestamps
    end
  end
end
