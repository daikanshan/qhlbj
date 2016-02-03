class Admin::ConfigsController < AdminController
  before_action :set_admin_config, only: [:show, :edit, :update, :destroy]

  # GET /admin/configs
  # GET /admin/configs.json
  def index
    @admin_configs = Admin::Config.all
  end

  # GET /admin/configs/1
  # GET /admin/configs/1.json
  def show
  end

  # GET /admin/configs/new
  def new
    @admin_config = Admin::Config.new
  end

  # GET /admin/configs/1/edit
  def edit
  end

  # POST /admin/configs
  # POST /admin/configs.json
  def create
    @admin_config = Admin::Config.new(admin_config_params)

    respond_to do |format|
      if @admin_config.save
        format.html { redirect_to @admin_config, notice: 'Config was successfully created.' }
        format.json { render :show, status: :created, location: @admin_config }
      else
        format.html { render :new }
        format.json { render json: @admin_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/configs/1
  # PATCH/PUT /admin/configs/1.json
  def update
    respond_to do |format|
      if @admin_config.update(admin_config_params)
        format.html { redirect_to @admin_config, notice: 'Config was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_config }
      else
        format.html { render :edit }
        format.json { render json: @admin_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/configs/1
  # DELETE /admin/configs/1.json
  def destroy
    @admin_config.destroy
    respond_to do |format|
      format.html { redirect_to admin_configs_url, notice: 'Config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_config
      @admin_config = Admin::Config.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_config_params
      params.require(:admin_config).permit(:name, :avatar, :val, :url)
    end
end
