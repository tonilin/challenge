class Authorization < ActiveRecord::Base

  belongs_to :user, :inverse_of => :authorizations

  def refresh_token(token)
    self.update_attribute(:token, token)
  end

end
