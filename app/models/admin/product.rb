class Admin::Product < ActiveRecord::Base
  belongs_to :category
end
