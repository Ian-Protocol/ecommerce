class Product < ApplicationRecord
    has_many :order_items
    has_many :orders, through: :order_items
    has_many :cart_items
    has_many :carts, through: :cart_items
    has_many :categorizations
    has_many :categories, through: :categorizations
    has_one_attached :image

    def self.ransackable_attributes(auth_object = nil)
        ["id", "name", "description", "price", "stock_quantity", "created_at", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["order_items", "orders", "cart_items", "carts", "categorizations", "categories", "image_attachment", "image_blob"]
    end
end
