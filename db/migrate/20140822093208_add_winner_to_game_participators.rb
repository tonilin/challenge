class AddWinnerToGameParticipators < ActiveRecord::Migration
  def change
    add_column :game_participators, :is_winner, :boolean, :default => false
  end
end
