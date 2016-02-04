class Home::HomeController < HomeController
  def index
    @mubu = Admin::Bimage.where(shown:1)
  end
end
