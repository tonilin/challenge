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

  validates_presence_of :title, :description

end
