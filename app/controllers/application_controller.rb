class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_cart, :set_latest_releases

  private

    def set_cart
      @cart ||= current_cart
    end

    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

    def set_latest_releases
      @latest_releases ||= Product.doomtown_products.order(release_date: :desc).select("id, name, band_name, cover_art").take(3)
    end
end
