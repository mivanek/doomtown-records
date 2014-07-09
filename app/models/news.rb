class News < ActiveRecord::Base
  validates_presence_of :title, :body

  def news_image
    if image_path
      "news/" + image_path
    else
      nil
    end
  end
end
