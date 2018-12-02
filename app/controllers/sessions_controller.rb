class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
  end

  def create
    if login(params[:email], params[:password])
      flash[:success] = "Hello #{params[:email]}!"
      redirect_back_or_to root_path
    else
      flash.now[:alert] = "Email and/or password are incorrect."
      render 'new'
    end
  end

  def destroy
    logout
    flash[:success] = "See you!"
    redirect_to login_path
  end
end
