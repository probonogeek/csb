class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  private

  def ensure_authentication

    unless current_user
      store_location
      redirect_to( login_url, :notice => "Please login first" )
    end

  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default,options = {})
    redirect_to(session[:return_to] || default, options)
    session[:return_to] = nil
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

end
