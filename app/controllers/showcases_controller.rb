class ShowcasesController < ApplicationController
 
  before_filter :require_login, only: [:destroy, :new, :create]



  # GET /showcases
  # GET /showcases.json
  def index
    if current_user== current_user.level >100
      @showcases = Showcase.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @showcases }
      end
    end
  end

  # GET /showcases/1
  # GET /showcases/1.json
  def show

    if (params[:user_id])

      @user = User.find(params[:user_id])
      @gallery= @user.gallery
      @showcase= @gallery.showcases.find(params[:id])

    else
      @showcase = Showcase.find(params[:id])
      @gallery = @showcase.gallery
      @user = @gallery.user
    end
    

    #@gallery = @showcase.gallery    
    
    #@showcase = Gallery.find(params[:gallery_id]).showcase[:id]

    #@gallery = Gallery.find(params[:gallery])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @showcase }
    end
  end

  # GET /showcases/new
  # GET /showcases/new.json
  def new
    @showcase = Showcase.new

    respond_to do |format|
      format.html # new.html.erb
      format.js
      #format.json { render json: @showcase }
      
    end
  end

  # GET /showcases/1/edit
  def edit
    #@showcase = Showcase.find(params[:id])
      if (params[:user_id])

      @user = User.find(params[:user_id])
      @gallery= @user.gallery
      @showcase= @gallery.showcases.find(params[:id])

    else
      @showcase = Showcase.find(params[:id])
      @gallery = @showcase.gallery
      @user = @gallery.user
    end
  end

  # POST /showcases
  # POST /showcases.json
  def create

    @showcase = current_user.gallery.showcases.build(showcase_params)
    @user = current_user
    respond_to do |format|
      if @showcase.save
        format.html { redirect_back_or_to @user, notice: 'Showcase was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @showcase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /showcases/1
  # PATCH/PUT /showcases/1.json
  def update
    @showcase = Showcase.find(params[:id])
    if current_user== @showcase.gallery.user || current_user.level >100
      respond_to do |format|
        if @showcase.update_attributes(showcase_params)
          format.html { redirect_to @showcase, notice: 'Showcase was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @showcase.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /showcases/1
  # DELETE /showcases/1.json
  def destroy
    @showcase = Showcase.find(params[:id])
    if current_user== @showcase.gallery.user || current_user.level >100
      @showcase.destroy

      respond_to do |format|
        format.html { redirect_to :back}
        format.json { head :no_content }
      end
    end
  end

  def comments
    @title = "Comments for: "
    @user = User.find(params[:user_id])
    @gallery = @user.gallery
    @showcase= @gallery.showcases.find(:id)
    @comments = @showcase.comments

    render 'show_showcase'
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def showcase_params
      params.require(:showcase).permit(:id, :title,:gallery, :description, :likes, :canvas, :upload_date, :visits)
    end
end
