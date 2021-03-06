class UsersController < ApplicationController
  # GET /users
  # GET /users.json

skip_before_filter :require_login, only: [:index, :new, :create, :main]

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @title = @user.username + ' Profile'
    @gallery = @user.gallery
    @showcases = @gallery.showcases.paginate(page: params[:page], per_page: 8)
    @showcase = current_user.gallery.showcases.build
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def main
    @showcases = Showcase.where('').paginate(page: params[:page], per_page: 8)


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end


  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.level = 1


    respond_to do |format|
      if @user.save
	     format.html{ redirect_back_or_to root_path, notice: 'User was successfully created'}
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def liking
    @title = "Liking"
    @user = User.find(params[:id])
    @showcases = @user.likes.paginate(page: params[:page])
    render 'show_likes'
  end

  def showcases
    @title = "Gallery"
    @user = User.find(params[:id])
    @gallery = @user.gallery
    render 'show_gallery'
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
  def user_params
    params.require(:user).permit(:id, :username, :email, :password, :password_confirmation, :avatar, :gallery)
  end
end
