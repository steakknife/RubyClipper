class SessionsController < ApplicationController

  def new
#    redirect_to '/auth/github'
  end

  def create
    auth_hash = request.env['omniauth.auth']
    user = User.create_with_omniauth(auth_hash)
#    authorization = Authorization.where(provider: auth_hash['provider'],
#                                        uid: auth_hash['uid'].to_s).first
#    user = (authorization) ? authorization.user : User.create_with_omniauth(auth_auth)
#    user = User.where(:provider => auth['provider'],
#                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    # Reset the session after successful login, per
    # 2.8 Session Fixation – Countermeasures:
    # http://guides.rubyonrails.org/security.html#session-fixation-countermeasures
    reset_session
    session[:user_id] = user.id
    if user.email.blank?
      redirect_to edit_user_path(user), :alert => "Please enter your email address."
    else
      redirect_to root_url, notice: 'Signed in!'
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'Signed out!'
  end

  def failure
    redirect_to root_url, alert: "Authentication error: #{params[:message].humanize}"
  end

end

