class Admin::Bimage < ActiveRecord::Base
  mount_uploader :avatar, Admin::BimageAvatarUploader

  def isShown
    if shown==0
      "不显示"
    else
      "显示中"
    end
  end
end
