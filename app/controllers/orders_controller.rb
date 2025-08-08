class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.includes(:order_items, :products)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def new
    cart = session[:cart] || {}
    @cart_items = cart.map do |product_id, quantity|
    product = Product.find_by(id: product_id)
    next unless product
    { product: product, quantity: quantity }
    end.compact

    @order = Order.new
    @addresses = current_user.addresses
    @new_address = Address.new
  end


  def create
    @cart = session[:cart] || {}
    if @cart.empty?
      redirect_to cart_path, alert: "Your cart is empty."
      return
    end

    # Handle the address
    if params[:address_id].present?
      address = current_user.addresses.find_by(id: params[:address_id])
      unless address
        redirect_to new_order_path, alert: "Selected address not found."
        return
      end
    else
      address = current_user.addresses.build(order_params[:address_attributes])
      unless address.save
        @cart_items = @cart.map do |product_id, quantity|
          product = Product.find_by(id: product_id)
          next unless product
          { product: product, quantity: quantity }
        end.compact
        @order = Order.new
        @addresses = current_user.addresses
        @new_address = address  # Keep the invalid address to show validation errors
        flash.now[:alert] = "Address validation failed: #{address.errors.full_messages.join(', ')}"
        render :new
        return
      end
    end

    # Calculate totals
    cart_items = @cart.map do |product_id, quantity|
      product = Product.find_by(id: product_id)
      next unless product
      {
        product: product,
        quantity: quantity.to_i,
        subtotal: product.price * quantity.to_i
      }
    end.compact

    subtotal = cart_items.sum { |item| item[:subtotal] }
    province = address.province
    gst = province.gst || 0
    pst = province.pst || 0
    total_tax = subtotal * (gst + pst)
    total = subtotal + total_tax

    # Create the order
    order = current_user.orders.build(
      address: address,
      status: "Pending",
      subtotal: subtotal,
      tax: total_tax,
      total: total
    )

    if order.save
      cart_items.each do |item|
        order.order_items.create!(
          product: item[:product],
          quantity: item[:quantity],
          price: item[:product].price
        )
      end

      session[:cart] = {} # clear cart
      redirect_to order_path(order), notice: "Order placed successfully!"
    else
      redirect_to new_order_path, alert: "Failed to place order."
    end
  end

  private

  def order_params
    params.require(:order).permit(address_attributes: [:street1, :street2, :city, :postal_code, :province_id])
  end
end
