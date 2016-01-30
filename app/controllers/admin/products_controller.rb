class Admin::ProductsController < AdminController
  before_action :set_admin_product, only: [:show, :edit, :update, :destroy]

  # GET /admin/products
  # GET /admin/products.json
  def index
    @admin_products = Admin::Product.all
  end

  # GET /admin/products/1
  # GET /admin/products/1.json
  def show
  end

  # GET /admin/products/new
  def new
    @admin_product = Admin::Product.new
    @categories = Admin::Category.all
  end

  # GET /admin/products/1/edit
  def edit
    @categories = Admin::Category.all
    @category = @admin_product.category.name
  end

  # POST /admin/products
  # POST /admin/products.json
  def create
    @admin_product = Admin::Product.new(admin_product_params)

    respond_to do |format|
      if @admin_product.save
        format.html { redirect_to admin_products_url }
        format.json { render :show, status: :created, location: @admin_product }
      else
        format.html { render :new }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/products/1
  # PATCH/PUT /admin/products/1.json
  def update
    respond_to do |format|
      if @admin_product.update(admin_product_params)
        format.html { redirect_to admin_products_url }
        format.json { render :show, status: :ok, location: @admin_product }
      else
        format.html { render :edit }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/products/1
  # DELETE /admin/products/1.json
  def destroy
    @admin_product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url }
      format.json { head :no_content }
    end
  end
  def batch_destroy
    ids = params[:ids].split(",").flatten
    if ids.nil?||ids.empty?
      respond_to do |format|
        format.html { redirect_to admin_products_url,notice:'未选择产品！'}
        format.json { head :no_content }
      end
    else
      ids.each do |id|
        Admin::Product.find(id).destroy
      end
      respond_to do |format|
        format.html { redirect_to admin_products_url,notice:'操作成功！'}
        format.json { head :no_content }
      end
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_product
      @admin_product = Admin::Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_product_params
      params.require(:admin_product).permit(:name, :product, :describe, :img_url, :category_id)
    end
end
