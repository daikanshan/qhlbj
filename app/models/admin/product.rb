class Admin::Product < ActiveRecord::Base
  mount_uploader :avatar,Admin::ProductAvatarUploader
  belongs_to :category
end
