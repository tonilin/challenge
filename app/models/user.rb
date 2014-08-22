# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :games
  has_many :user_game_results
  has_many :game_results, :through => :user_game_results, :source => :game


  before_validation :extract_name_from_email, :on => :create




  concerning :Authorizations do
    included do
      extend OmniauthCallbacks
      has_many :authorizations, :dependent => :destroy

      def self.find_binding(provider, uid)
        Authorization.find_by_provider_and_uid(provider, uid)
      end
    end

    def bind_service(provider, uid, token)
      binding = self.class.find_binding(provider, uid)

      if !binding
        authorizations.create(:provider => provider , :uid => uid, :token => token)
      end
    end

    def fb_id
      binding = authorizations.find_by_provider("facebook")

      if binding
        binding.uid
      else
        nil
      end
    end

    private

  end



  concerning :GameParticipators do
    included do
      has_many :game_participators
      has_many :participated_games, :through => :game_participators, :source => :game
    end

    def game_participator(game)
      return nil if !game
      game_participators.find_by_game_id(game.id)
    end

    def participate!(game)
      return nil if !game

      if !participated?(game)
        game_participators.create({
          game_id: game.id
        })
      else
        game_participator(game)
      end
    end

    def participated?(game)
      game_participator(game).present?
    end

    def leave!(game)
      return nil if !game

      if participated?(game)
        game_participator(game).destroy
      end
    end

    private

  end



  def extract_name_from_email
    return if name.present? && name.length >= 3
    return if email.blank?

    name_temp = email.split("@")[0].to_url

    if User.find_by_name(name_temp).present? || name_temp.length < 3
      name_temp = "#{name_temp}#{Time.now.to_i}"
    end

    self.name = name_temp
  end



end
