# == Schema Information
#
# Table name: game_participators
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  game_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  is_winner  :boolean          default(FALSE)
#

class GameParticipator < ActiveRecord::Base

  belongs_to :user
  belongs_to :game

  scope :winners, -> {where("is_winner", true)}

  def win!
    self.is_winner = true
    self.save
  end

end
