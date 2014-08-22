class UserGameResult < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  mount_uploader :image, ImageUploader

end
