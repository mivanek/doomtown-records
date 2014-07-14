class ShopController < ApplicationController
  def index
    if params[:filter]
      @releases = Product.where("format = ?", params[:filter].downcase)
    else
      @releases = Product.all
    end
    render 'releases/index'
  end
end
