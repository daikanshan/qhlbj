module HomeHelper
  def nav_active(controller)
    if params[:controller]==controller
      "active"
    end
  end
end
