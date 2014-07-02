class ReleasesController < ApplicationController
  def index
    @releases = Products.doomtown_products
  end

  def show
    @release = Products.find(params[:id])
  end
end
