class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:session][:email] && params[:session][:password]
      user = User.find_by_email(params[:session][:email])
      if helpers.log_in(user)
        flash.now[:success] = "Welcome back!"
        redirect_to user
      else
        flash.now[:danger] = "Something goes wrong, check your email \\ password and try again."
        render :new
      end
    end
  end

  def destroy
    session.destroy
    flash.now[:info] = "Goodbye!"
    redirect_to root_path
  end
end
