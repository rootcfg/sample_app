module SessionsHelper

  def log_in(user)
    if !user.nil? && user.authenticate(params[:session][:password])
      session[:user_id]    = user.id
      session[:name]       = user.name
      session[:email]      = user.email
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

end
