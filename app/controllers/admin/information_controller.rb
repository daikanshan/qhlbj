class Admin::InformationController < AdminController
  before_action :set_admin_information, only: [:show, :edit, :update, :destroy]

  # GET /admin/information
  # GET /admin/information.json

  def index
    @admin_information = Admin::Information.all
  end

  # GET /admin/information/1
  # GET /admin/information/1.json
  def show
  end

  # GET /admin/information/new
  def new
    @admin_information = Admin::Information.new
  end

  # GET /admin/information/1/edit
  def edit
  end

  # POST /admin/information
  # POST /admin/information.json
  def create
    @admin_information = Admin::Information.new(admin_information_params)

    respond_to do |format|
      if @admin_information.save
        format.html { redirect_to @admin_information }
        format.json { render :show, status: :created, location: @admin_information }
      else
        format.html { render :new }
        format.json { render json: @admin_information.errors, status: :unprocessable_entity }
      end
    end
  end
  def batch_destroy
    ids = params[:ids].split(",").flatten
    if ids.nil?||ids.empty?
      respond_to do |format|
        format.html { redirect_to admin_information_index_url,notice:'未选择产品！'}
        format.json { head :no_content }
      end
    else
      ids.each do |id|
        Admin::Information.find(id).destroy
      end
      respond_to do |format|
        format.html { redirect_to admin_information_index_url,notice:'操作成功！'}
        format.json { head :no_content }
      end
    end
  end
  # PATCH/PUT /admin/information/1
  # PATCH/PUT /admin/information/1.json
  def update
    respond_to do |format|
      if @admin_information.update(admin_information_params)
        format.html { redirect_to @admin_information }
        format.json { render :show, status: :ok, location: @admin_information }
      else
        format.html { render :edit }
        format.json { render json: @admin_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/information/1
  # DELETE /admin/information/1.json
  def destroy
    @admin_information.destroy
    respond_to do |format|
      format.html { redirect_to admin_information_index_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_information
      @admin_information = Admin::Information.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_information_params
      params.require(:admin_information).permit(:title, :content, :tp)
    end
end
