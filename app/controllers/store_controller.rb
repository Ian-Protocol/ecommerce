class StoreController < ApplicationController
  def index
    @categories = Category.all
    @selected_category = params[:category_id]
    @search_query = params[:search]
    
    @products = Product.includes(:categories)

    # SQLite is case insensitive for LIKE.
    if @search_query.present?
      @products = @products.where("name LIKE ? OR description LIKE ?", "%#{@search_query}%", "%#{@search_query}%")
    end
    
    # Ctegory filter
    if @selected_category.present?
      @products = @products.joins(:categories).where(categories: { id: @selected_category })
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
