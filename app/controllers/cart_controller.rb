class CartController < ApplicationController
  before_filter :store_location, only: :show
  before_filter :get_line_item, only: [:reduce_quantity, :increase_quantity]

  def show
    @previous_location = retrieve_location
    @line_items = @cart.line_items
  end

  def destroy
    @cart.destroy
    session[:cart_id] = nil

    respond_to do |format|
      format.html { redirect_to shop_index_path }
    end
  end

  def reduce_quantity
    @line_item = @cart.remove_product(@line_item.product.id)

    respond_to do |format|
      format.html { redirect_to cart_path(@cart) }
    end
  end

  def increase_quantity
    @line_item = @cart.add_product(@line_item.product.id)

    respond_to do |format|
      format.html { redirect_to cart_path(@cart) }
    end
  end

  private

    def get_line_item
      @line_item = @cart.line_items.find_by_id(params[:line_item_id])
    end

    def store_location
      session[:return_to] ||= request.referer unless request.referer == request.original_url
    end

    def retrieve_location
      session[:return_to]
    end
end
