class Admin::BimagesController < AdminController
  before_action :set_admin_bimage, only: [:show, :edit, :update, :destroy]

  # GET /admin/bimages
  # GET /admin/bimages.json
  def index
    @admin_bimages = Admin::Bimage.all
  end

  # GET /admin/bimages/1
  # GET /admin/bimages/1.json
  def show
  end

  # GET /admin/bimages/new
  def new
    @admin_bimage = Admin::Bimage.new
  end

  # GET /admin/bimages/1/edit
  def edit
  end

  # POST /admin/bimages
  # POST /admin/bimages.json
  def create
    @admin_bimage = Admin::Bimage.new(admin_bimage_params)

    respond_to do |format|
      if @admin_bimage.save
        format.html { redirect_to @admin_bimage, notice: 'Bimage was successfully created.' }
        format.json { render :show, status: :created, location: @admin_bimage }
      else
        format.html { render :new }
        format.json { render json: @admin_bimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/bimages/1
  # PATCH/PUT /admin/bimages/1.json
  def update
    respond_to do |format|
      if @admin_bimage.update(admin_bimage_params)
        format.html { redirect_to @admin_bimage }
        format.json { render :show, status: :ok, location: @admin_bimage }
      else
        format.html { render :edit }
        format.json { render json: @admin_bimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/bimages/1
  # DELETE /admin/bimages/1.json
  def destroy
    @admin_bimage.destroy
    respond_to do |format|
      format.html { redirect_to admin_bimages_url }
      format.json { head :no_content }
    end
  end
  def batch_destroy
    ids = params[:ids].split(",").flatten
    if ids.nil?||ids.empty?
      respond_to do |format|
        format.html { redirect_to admin_bimages_url,notice:'未选择分类！'}
        format.json { head :no_content }
      end
    else
      ids.each do |id|
        Admin::Bimage.find(id).destroy
      end
      respond_to do |format|
        format.html { redirect_to admin_bimages_url,notice:'操作成功！'}
        format.json { head :no_content }
      end
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_bimage
      @admin_bimage = Admin::Bimage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_bimage_params
      params.require(:admin_bimage).permit(:title,:url, :avatar, :shown, :abstract)
    end
end
