class Admin::Config < ActiveRecord::Base
  mount_uploader :avatar, Admin::ConfigAvatarUploader
  def status
    if val ==1
      "显示"
    else
      "不显示"
    end
  end
end
