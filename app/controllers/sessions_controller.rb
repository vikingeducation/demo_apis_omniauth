class SessionsController < ApplicationController
 
  def create

    # We'll define `from_omniauth` shortly
    # The "omniauth.auth" environment variable is
    # how Omniauth stores the response it got back
    # from Facebook.  We'll tap into it in a second.
    user = User.from_omniauth(env["omniauth.auth"])

    # Assume we'll use session-based auth
    session[:user_id] = user.id
    redirect_to root_url
  end


  def destroy
    session[:user_id] = nil
    @current_user = nil
    redirect_to root_url
  end
end
