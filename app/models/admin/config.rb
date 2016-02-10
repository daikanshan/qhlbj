class Admin::Config < ActiveRecord::Base
  mount_uploader :avatar, Admin::ConfigAvatarUploader
  before_create :check_url
  before_update :check_url

  def check_url
    if self.url =~ /(http:\/\/|ftp:\/\/|https:\/\/)/

    else
      self.url = "http://#{self.url}"
    end
  end
  def status
    if val ==1
      "显示"
    else
      "不显示"
    end
  end
end
