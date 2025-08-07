class StoreController < ApplicationController
  def index
    @products = Product.includes(:categories).all
  end

  def show
    @product = Product.find(params[:id])
  end
end
