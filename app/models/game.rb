# == Schema Information
#
# Table name: games
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Game < ActiveRecord::Base
  belongs_to :user
  has_many :game_participators, :dependent => :destroy
  has_many :participated_users, :through => :game_participators, :source => :user



  validates_presence_of :title, :description

end
