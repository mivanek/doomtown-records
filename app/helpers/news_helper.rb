module NewsHelper
  def news_image(news)
    news.news_image || "news-placeholder.png"
  end

  def read_more_link(news)
    link_to news_path(news) do
      image_tag "read-more.png"
    end
  end
end
