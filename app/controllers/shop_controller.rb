class ShopController < ApplicationController
  def index
    @releases = Product.where(nil).sort_by(params[:sort_by])
    @releases = @releases.search(params[:search]) if params[:search].present?
    @releases = @releases.filter(params[:filter]) if params[:filter].present?
    @releases = @releases.order(params[:sort_by]) if params[:sort_by].present?

    render 'releases/index'
  end
end
