class ReleasesController < ApplicationController
  def index
    if params[:filter] == "all"
      @releases = Product.doomtown_products.order(params[:sort_by])
    elsif params[:filter] || params[:sort_by]
      @releases = Product.doomtown_products.where('format = ?', params[:filter]).order(params[:sort_by])
    else
      @releases = Product.doomtown_products.order('release_date ASC')
    end
  end

  def show
    @release = Product.find(params[:id])
  end
end
