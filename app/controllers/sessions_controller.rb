class SessionsController < ApplicationController
  before_filter :redirect_logged_in_user, only: [:new]

  def new
    render :new, layout: 'ember'
  end

  def create
    user = User.find_by_email(params[:email])

    if UserAuth.new(user).login(params[:password])
      session[:session_key] = user.session_key
      redirect_to root_url
    else
      # add errors
      redirect_to login_url
    end
  end

  def destroy
    UserAuth.new(current_user).logout
    reset_session
    redirect_to login_url
  end
end