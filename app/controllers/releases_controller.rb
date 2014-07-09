class ReleasesController < ApplicationController
  def index
    @releases = Product.doomtown_products
  end

  def show
    @release = Product.find(params[:id])
  end
end
