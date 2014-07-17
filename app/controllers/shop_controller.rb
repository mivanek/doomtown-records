class ShopController < ApplicationController
  def index
    if params[:filter] == "all"
      @releases = Product.order(params[:sort_by])
    elsif params[:filter] || params[:sort_by]
      @releases = Product.where('format = ?', params[:filter]).order(params[:sort_by])
    else
      @releases = Product.order('release_date ASC')
    end
    render 'releases/index'
  end

  def search
    @releases = Product.where('name ~* ? or band_name ~* ?', params[:search], params[:search])
    render 'releases/index'
  end
end
