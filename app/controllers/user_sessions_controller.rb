class UserSessionsController < ApplicationController

skip_before_filter :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember_me])
      
      if @user.level >100
      redirect_to(:users, notice: 'Login successful')
      else
        redirect_to(root_path, notice: 'Welcome '+@user.username)
      end
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end
