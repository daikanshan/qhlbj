class Home::ProductController < HomeController
  before_action :set_product, only: [:show]
  def index
    @products = Admin::Product.all
    @categories = Admin::Category.where(:supcategory_id==nil)
  end

  def show
  end
  private
  def set_product
    @product = Admin::Product.find_by_id(params[:id])
  end
end
