class Admin::CulturesController < AdminController
  before_action :set_admin_culture, only: [:show, :edit, :update, :destroy]

  # GET /admin/cultures
  # GET /admin/cultures.json
  def index
    @admin_culture = Admin::Culture.first
    render :show
  end

  # GET /admin/cultures/1
  # GET /admin/cultures/1.json
  def show
  end

  # GET /admin/cultures/new
  def new
    @admin_culture = Admin::Culture.new
  end

  # GET /admin/cultures/1/edit
  def edit
  end

  # POST /admin/cultures
  # POST /admin/cultures.json
  def create
    @admin_culture = Admin::Culture.new(admin_culture_params)

    respond_to do |format|
      if @admin_culture.save
        format.html { redirect_to @admin_culture }
        format.json { render :show, status: :created, location: @admin_culture }
      else
        format.html { render :new }
        format.json { render json: @admin_culture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/cultures/1
  # PATCH/PUT /admin/cultures/1.json
  def update
    respond_to do |format|
      if @admin_culture.update(admin_culture_params)
        format.html { redirect_to @admin_culture }
        format.json { render :show, status: :ok, location: @admin_culture }
      else
        format.html { render :edit }
        format.json { render json: @admin_culture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/cultures/1
  # DELETE /admin/cultures/1.json
  def destroy
    @admin_culture.destroy
    respond_to do |format|
      format.html { redirect_to admin_cultures_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_culture
      @admin_culture = Admin::Culture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_culture_params
      params.require(:admin_culture).permit(:title, :content)
    end
end
