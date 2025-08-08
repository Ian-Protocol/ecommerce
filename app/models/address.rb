  class Address < ApplicationRecord
  belongs_to :user
  belongs_to :province

  has_many :orders

  validates :street1, presence: true, length: { minimum: 5, maximum: 100 }
  validates :city, presence: true, length: { minimum: 2, maximum: 50 }
  validates :postal_code, presence: true, format: { with: /\A[A-Za-z]\d[A-Za-z] ?\d[A-Za-z]\d\z/, message: "must be a valid postal code (e.g., K1A 0A6)" }
  validates :province_id, presence: true

  def full_address
    address_parts = [street1, street2, city, province.name, postal_code].compact.reject(&:blank?)
    address_parts.join(", ")
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "user_id", "province_id", "street1", "street2", "city", "postal_code", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user", "province", "orders"]
  end
end
