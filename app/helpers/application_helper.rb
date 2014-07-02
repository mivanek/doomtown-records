module ApplicationHelper

  def navigation_links(item)
    if params[:controller].include? item.gsub(/_index/, '')
      link_to '', self.send("#{item}_path"), class: "nav-link active #{item.gsub(/_index/, '')}"
    else
      link_to '', self.send("#{item}_path"), class: "nav-link #{item.gsub(/_index/, '')}"
    end
  end
end
