module NewsHelper
  def news_image(news)
    news.image_path || "news-placeholder.png"
  end
end
