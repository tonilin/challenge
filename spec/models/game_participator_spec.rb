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

require 'rails_helper'

RSpec.describe GameParticipator, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
