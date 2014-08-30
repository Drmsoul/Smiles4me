class ShowcasesController < ApplicationController
 
  before_filter :require_login, only: [:destroy, :new, :create]
  # GET /showcases
  # GET /showcases.json
  def index
    @showcases = Showcase.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @showcases }
    end
  end

  # GET /showcases/1
  # GET /showcases/1.json
  def show
    @showcase = Showcase.find(params[:id])
    @gallery = Gallery.find(params[:gallery])
    @user = @gallery.user
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
    @showcase = Showcase.find(params[:id])
  end

  # POST /showcases
  # POST /showcases.json
  def create
    @showcase = current_user.gallery.showcases.build(showcase_params)

    respond_to do |format|
      if @showcase.save
        format.html { redirect_back_or_to @showcase, notice: 'Showcase was successfully created.' }
        format.json { render json: @showcase, status: :created, location: @showcase }
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

  # DELETE /showcases/1
  # DELETE /showcases/1.json
  def destroy
    @showcase = Showcase.find(params[:id])
    @showcase.destroy

    respond_to do |format|
      format.html { redirect_to showcases_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def showcase_params
      params.require(:showcase).permit(:id,:gallery, :description, :likes, :canvas, :upload_date, :visits)
    end
end
