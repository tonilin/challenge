# == Schema Information
#
# Table name: game_participators
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  game_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class GameParticipator < ActiveRecord::Base
end
