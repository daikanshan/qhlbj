class Home::AboutController < HomeController
  def index
    @info = Admin::Info.first
    @culture = Admin::Culture.first
  end
end
