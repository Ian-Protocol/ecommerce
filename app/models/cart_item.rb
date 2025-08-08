  class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates_numericality_of :quantity, greater_than: 0

  def self.ransackable_attributes(auth_object = nil)
    ["id", "cart_id", "product_id", "quantity", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["cart", "product"]
  end
end
