module UsersHelper

  def render_user_avatar(user)
    if user.fb_id.present?
      image_tag("https://graph.facebook.com/#{user.fb_id}/picture?width=50&height=50")
    else
      image_tag(gravatar_url(user.email, 50))
    end
  end


  def gravatar_url(email = "", size = 80)
    email_digest = Digest::MD5.hexdigest(email.to_s.downcase)
    "//www.gravatar.com/avatar/#{email_digest}?size=#{size}&default=wavatar"
  end


end