# == Schema Information
#
# Table name: authorizations
#
#  id         :integer          not null, primary key
#  provider   :string(255)
#  user_id    :integer
#  uid        :string(255)
#  token      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Authorization, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
