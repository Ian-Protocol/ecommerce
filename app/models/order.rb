class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address

  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  accepts_nested_attributes_for :address

  validates :status, presence: true, inclusion: { in: %w[Pending Processing Shipped Delivered Cancelled] }
  validates :subtotal, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :tax, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
  def total_items
    order_items.sum(:quantity)
  end
end
