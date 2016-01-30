class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_init

  def check_init
    if Admin::Category.all.count==0
      Admin::Category.create(name:"默认")
    end
  end
end
