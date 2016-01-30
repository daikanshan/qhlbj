module Admin::InformationHelper
  def information_title
    return "最新动态" if params[:action]=="dynamic"
    return "行业新闻" if params[:action]=="news"
    return "公司简介" if params[:action]=="info"
    return "公司文化" if params[:action]=="culture"
  end
end
