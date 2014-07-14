class LineItemsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    @line_item.product = product

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to cart_path(@cart.id) }
      end
    end
  end

  def destroy
    product = Product.find(params[:product_id])
    @cart.remove_product(product.id)
    respond_to do |format|
      format.html { redirect_to cart_path(@cart.id) }
    end
  end
end
