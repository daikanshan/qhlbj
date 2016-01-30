module AdminHelper
  def current_controller(controllers)
    controllers.each do |controller|
      if params[:controller]==controller
        return "current_controller"
      end
    end
    return " "
  end

  def current_action(controller,actions)
    if params[:controller]==controller
      actions.each do |action|
         return "current_action" if params[:action]==action
      end
    end
  end
end
