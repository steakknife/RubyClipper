class SessionsController < ApplicationController

  def new
#    redirect_to '/auth/github'
  end

  def create
    auth_hash = request.env['omniauth.auth']
    user = User.create_with_omniauth(auth_hash)
    # Reset the session after successful login, per
    # 2.8 Session Fixation – Countermeasures:
    # http://guides.rubyonrails.org/security.html#session-fixation-countermeasures
    reset_session
    session[:user_id] = user.id
    $stderr.puts "sessions create user_id #{session[:user_id]} email #{user.email}"
    if user.email =~ /\Atwitter[0-9]+@domain.com\z/ || user.email.blank?
      redirect_to edit_user_path(user), alert:  'Please enter your email address.'
    else
      redirect_to root_url, notice: "Signed in using #{auth_hash['provider'].capitalize}"
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

