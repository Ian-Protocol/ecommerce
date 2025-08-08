  class Cart < ApplicationRecord
  belongs_to :user

  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def self.ransackable_attributes(auth_object = nil)
    ["id", "user_id", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user", "cart_items", "products"]
  end
end
