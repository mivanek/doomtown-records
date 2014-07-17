module ApplicationHelper

  def navigation_link(item)
    if params[:controller].include? item.gsub(/_index/, '')
      link_to '', self.send("#{item}_path"), class: "nav-link active #{item.gsub(/_index/, '')}"
    else
      link_to '', self.send("#{item}_path"), class: "nav-link #{item.gsub(/_index/, '')}"
    end
  end

  def shop_navigation_link(&block)
    if params[:controller].include? "shop"
      content_tag(:div, class: "shop-dropdown active") do
        capture(&block)
      end
    else
      content_tag(:div, class: "shop-dropdown") do
        capture(&block)
      end
    end
  end

  def search_path_string
    if request.path.include? "search"
      request.path
    else
      request.path + "/search"
    end
  end
end
