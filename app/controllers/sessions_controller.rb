class SessionsController < ApplicationController
  def new
  end

  def create
    if login(params[:email], params[:password])
      flash[:success] = "Witaj #{params[:email]}!"
      redirect_to root_path
    else
      flash.now[:warning] = "Email i/lub hasło są nieprawidłowe."
      render 'new'
    end
  end

  def destroy
    logout
    flash[:success] = "Do zobaczenia!"
    redirect_to login_path
  end
end
