class ReleasesController < ApplicationController
  def index
    @releases = Product.doomtown_products.where(nil).sort_by(params[:sort_by])
    @releases = @releases.search(params[:search]) if params[:search].present?
    @releases = @releases.filter(params[:filter]) if params[:filter].present?
  end

  def show
    @release = Product.find(params[:id])
    gon.bandcamp_id = @release.bandcamp_id
  end
end
