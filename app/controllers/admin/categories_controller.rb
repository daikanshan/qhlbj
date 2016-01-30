class Admin::CategoriesController < AdminController
  before_action :set_admin_category, only: [:show, :edit, :update, :destroy]

  # GET /admin/categories
  # GET /admin/categories.json
  def index
    @admin_categories = Admin::Category.all
  end

  # GET /admin/categories/1
  # GET /admin/categories/1.json
  def show
  end

  # GET /admin/categories/new
  def new
    @admin_category = Admin::Category.new
    @categories = Admin::Category.all
  end

  # GET /admin/categories/1/edit
  def edit
    @categories = Admin::Category.all.where.not(id:@admin_category.id)
    if @admin_category.supcategory.nil?
      @category = nil
    else
      @category = @admin_category.supcategory
    end
  end

  # POST /admin/categories
  # POST /admin/categories.json
  def create
    @admin_category = Admin::Category.new(admin_category_params)

    respond_to do |format|
      if @admin_category.save
        format.html { redirect_to @admin_category }
        format.json { render :show, status: :created, location: @admin_category }
      else
        format.html { render :new }
        format.json { render json: @admin_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/categories/1
  # PATCH/PUT /admin/categories/1.json
  def update
    respond_to do |format|
      if @admin_category.update(admin_category_params)
        format.html { redirect_to @admin_category}
        format.json { render :show, status: :ok, location: @admin_category }
      else
        format.html { render :edit }
        format.json { render json: @admin_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/categories/1
  # DELETE /admin/categories/1.json
  def destroy
    @admin_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_categories_url }
      format.json { head :no_content }
    end
  end

  def batch_destroy
    ids = params[:ids].split(",").flatten
    if ids.nil?||ids.empty?
      respond_to do |format|
        format.html { redirect_to admin_categories_url,notice:'未选择分类！'}
        format.json { head :no_content }
      end
    else
      ids.each do |id|
        Admin::Category.find(id).destroy
      end
      respond_to do |format|
        format.html { redirect_to admin_categories_url,notice:'操作成功！'}
        format.json { head :no_content }
      end
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_category
      @admin_category = Admin::Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_category_params
      params.require(:admin_category).permit(:name,:supcategory_id)
    end
end
