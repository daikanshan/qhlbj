class Admin::InfosController < AdminController
  before_action :set_admin_info, only: [:show, :edit, :update, :destroy]

  # GET /admin/infos
  # GET /admin/infos.json
  def index
    @admin_infos = Admin::Info.all
    @admin_info = Admin::Info.first
    render :show
  end

  # GET /admin/infos/1
  # GET /admin/infos/1.json
  def show
  end

  # GET /admin/infos/new
  def new
    @admin_info = Admin::Info.new
  end

  # GET /admin/infos/1/edit
  def edit
  end

  # POST /admin/infos
  # POST /admin/infos.json
  def create
    @admin_info = Admin::Info.new(admin_info_params)

    respond_to do |format|
      if @admin_info.save
        format.html { redirect_to @admin_info }
        format.json { render :show, status: :created, location: @admin_info }
      else
        format.html { render :new }
        format.json { render json: @admin_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/infos/1
  # PATCH/PUT /admin/infos/1.json
  def update
    respond_to do |format|
      if @admin_info.update(admin_info_params)
        format.html { redirect_to @admin_info }
        format.json { render :show, status: :ok, location: @admin_info }
      else
        format.html { render :edit }
        format.json { render json: @admin_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/infos/1
  # DELETE /admin/infos/1.json
  def destroy
    @admin_info.destroy
    respond_to do |format|
      format.html { redirect_to admin_infos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_info
      @admin_info = Admin::Info.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_info_params
      params.require(:admin_info).permit(:title, :content)
    end
end
