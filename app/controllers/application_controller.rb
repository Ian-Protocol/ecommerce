class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_cart

  def current_cart
    session[:cart] ||= {}
  end

  def add_to_cart(product_id)
    product_id = product_id.to_s
    current_cart[product_id] ||= 0
    current_cart[product_id] += 1
  end

  def update_cart(product_id, quantity)
    product_id = product_id.to_s
    quantity = quantity.to_i
    if quantity <= 0
      current_cart.delete(product_id)
    else
      current_cart[product_id] = quantity
    end
  end

  def remove_from_cart(product_id)
    current_cart.delete(product_id.to_s)
  end
end
