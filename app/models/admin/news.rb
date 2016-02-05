class Admin::News < ActiveRecord::Base
  def title
    name
  end
end
