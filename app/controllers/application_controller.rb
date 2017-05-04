class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user_is_signed_in?

  def sign_in(user)
  	cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user=(user)
  	cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
	user = User.find_by(remember_token: cookies.permanent[:remember_token])
	if user 
  		return user
  	else
  		return nil
  	end
  end

  def sign_out(user)
  	cookies.permanent[:remember_token] = nil
  end

  def current_user_is_signed_in?
  	current_user
  end
end
