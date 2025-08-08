class CartController < ApplicationController
  def show
    @cart_items = current_cart.map do |product_id, quantity|
      product = Product.find_by(id: product_id)
      next unless product
      { product: product, quantity: quantity }
    end.compact

    @total = @cart_items.sum { |item| item[:product].price * item[:quantity] }
  end

  def add
    add_to_cart(params[:product_id])
    redirect_back fallback_location: store_index_path, notice: "Added to cart"
  end

  def update
    update_cart(params[:product_id], params[:quantity])
    redirect_to cart_path, notice: "Cart updated"
  end

  def remove
    remove_from_cart(params[:product_id])
    redirect_to cart_path, notice: "Item removed"
  end
end
