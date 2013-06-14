class SessionsController < ApplicationController
  skip_before_filter :require_authentication

  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Welcome!"
    else
      flash.now[:alert] = "Your email or password are not correct"
      render :new
    end
  end

    def destroy
      session[:user_id] = nil
      redirect_to root_path, :notice => "Successfully logged out!"
    end
end
