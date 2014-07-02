module NewsHelper
  def news_image(news)
    news.image_path || "news-placeholder.png"
  end

  def read_more_link(news)
    if news.body.length > 700
      link_to "Read More", news_path(news)
    end
  end
end
