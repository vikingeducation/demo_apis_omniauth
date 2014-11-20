class User < ActiveRecord::Base
  def self.from_omniauth(auth)

    # Do we have a user who already matches the 
    # `provider` and `uid`? 
    # If so, return the first User from that
    # If not, initialize a new user and pass along
    # the attributes we got from the `auth` object
    # Note that this object gives you its attributes
    # as methods so you don't need to use bracket notation
    where( :fb_provider => auth.provider, :fb_uid => auth.uid ).first_or_initialize.tap do |user|
      user.fb_provider = auth.provider
      user.fb_uid = auth.uid
      user.name = auth.info.name
      user.fb_token = auth.credentials.token
      user.fb_token_expires = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end