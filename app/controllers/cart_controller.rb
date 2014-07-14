class CartController < ApplicationController
  before_filter :store_location, only: :show

  def show
    @previous_location = retrieve_location
    @line_items = @cart.line_items
  end

  def destroy
    @cart.destroy
    session[:cart_id] = nil

    respond_to do |format|
      format.html { redirect_to shop_path }
    end
  end

  private

    def store_location
      session[:return_to] ||= request.referer unless request.referer == request.original_url
    end

    def retrieve_location
      session[:return_to]
    end
end
