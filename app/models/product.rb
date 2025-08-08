class Product < ApplicationRecord
    has_many :order_items
    has_many :orders, through: :order_items
    has_many :cart_items
    has_many :carts, through: :cart_items
    has_many :categorizations
    has_many :categories, through: :categorizations
    has_one_attached :image

    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :stock_quantity, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }

    def self.ransackable_attributes(auth_object = nil)
        ["id", "name", "description", "price", "stock_quantity", "created_at", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["order_items", "orders", "cart_items", "carts", "categorizations", "categories", "image_attachment", "image_blob"]
    end
end
