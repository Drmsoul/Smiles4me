class LikesController < ApplicationController
  # GET /likes
  # GET /likes.json
  def index
    @likes = Like.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @likes }
    end
  end

  # GET /likes/1
  # GET /likes/1.json

  # GET /likes/new
  # GET /likes/new.json




  # POST /likes
  # POST /likes.json
  def create

    @showcase = Showcase.find(params[:like][:showcase_id])
    @showcases = Gallery.find(@showcase.gallery.id).showcases.paginate(page: params[:page], per_page: 6)
    @user = @showcase.gallery.user
    unless current_user == @user
      current_user.like!(@showcase)
    end
    respond_to do |format|
      
        format.html { redirect_to :back }
        format.js
    end
  end

  # PATCH/PUT /likes/1
  # PATCH/PUT /likes/1.json


  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    print params[:id]

    @showcase = Like.find(params[:id]).showcase

    @showcases = Gallery.find(@showcase.gallery.id).showcases.paginate(page: params[:page], per_page: 6)
    
    current_user.unlike!(@showcase)
    respond_to do |format|
      format.html { redirect_back }
      format.js
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def like_params
      params.require(:like).permit(:showcase_id, :id)
    end
end
