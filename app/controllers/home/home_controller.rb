class Home::HomeController < HomeController
  def index
    @logo = Admin::Config.find_by_name("Logo")
    @weixin = Admin::Config.find_by_name("微信")
    @taobao = Admin::Config.find_by_name("淘宝")
    @weibo = Admin::Config.find_by_name("微博")
  end
end
