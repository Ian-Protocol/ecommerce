class Category < ApplicationRecord
    has_many :categorizations
    has_many :products, through: :categorizations

    validates :name, presence: true, length: { minimum: 2, maximum: 50 }, uniqueness: true

  def self.ransackable_associations(auth_object = nil)
    ["categorizations", "products"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "created_at", "updated_at"]
  end
end
