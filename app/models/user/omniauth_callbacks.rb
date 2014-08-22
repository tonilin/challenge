class User
  module OmniauthCallbacks

    def find_or_create_for_provider(provider, uid, data, token)
      binding = User.find_binding(provider, uid)

      if binding
        user = binding.user
        binding.refresh_token(token)
        fetch_remote_data(user, provider, uid, data)
        return user
      elsif user = User.find_by_email(data["email"])
        user.bind_service(provider, uid, token)
        fetch_remote_data(user, provider, uid, data)
        return user
      else
        user = User.new_from_provider_data(provider, uid, data, token)
        if user.save
          fetch_remote_data(user, provider, uid, data)
          user.bind_service(provider, uid, token)
          return user
        else
          return nil
        end
      end
    end


    def new_from_provider_data(provider, uid, data, token)
      user = User.new
      user.email = data["email"]
      # user.name = data["nickname"] ? data ["nickname"] : data["name"]      
      user.password = Devise.friendly_token[0,20]
      return user
    end

    def fetch_remote_data(user, provider, uid, data)
      if user.name.blank?
        fetch_name(user, provider, uid, data)
      end
    end

    def fetch_name(user, provider, uid, data)
      user.name = data[:name] if data[:name].present?
    end
    
  end
end