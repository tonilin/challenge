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

require 'rails_helper'

RSpec.describe UserGameResult, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
