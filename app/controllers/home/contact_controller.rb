class Home::ContactController < HomeController
  def index
    @info = Admin::Contact.first
  end
end
