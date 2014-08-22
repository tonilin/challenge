# == Schema Information
#
# Table name: user_game_results
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  game_id     :integer
#  description :string(255)
#  image       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class UserGameResult < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  mount_uploader :image, ImageUploader

end
