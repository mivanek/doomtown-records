class Show < ActiveRecord::Base
  belongs_to :band

  def show_string
    [date.strftime("%b %d"), club_name, city, country].join(', ')
  end
end
