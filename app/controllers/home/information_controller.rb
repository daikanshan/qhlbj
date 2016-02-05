class Home::InformationController < HomeController
  def index
    @dynamics = Admin::Information.all.order("created_at DESC")
    @news = Admin::News.all.order("created_at DESC")
  end

  def show
  end

  def news
    @info = Admin::News.find_by_id(params[:id])
    render 'show'
  end
  def dynamic
    @info = Admin::Information.find_by_id(params[:id])
    render 'show'
  end
end
