  class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address

  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  accepts_nested_attributes_for :address

  # Remember %w creates an array of strings!
  validates :status, presence: true, inclusion: { in: %w[Pending Processing Shipped Delivered Cancelled] }
  validates :subtotal, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :tax, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
  def total_items
    order_items.sum(:quantity)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "user_id", "address_id", "status", "subtotal", "tax", "total", "tracking", "ship_company", "ship_type", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user", "address", "order_items", "products"]
  end
end
