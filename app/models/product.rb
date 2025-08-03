class Product < ApplicationRecord
    has_many :order_items
    has_many :orders, through: :order_items
    has_many :cart_items
    has_many :carts, through: :cart_items
    has_many :categorizations
    has_many :categories, through: :categorizations
end
