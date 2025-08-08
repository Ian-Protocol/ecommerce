class Province < ApplicationRecord
    has_many :addresses

    validates :name, presence: true, length: { minimum: 2, maximum: 50 }, uniqueness: true
    validates :code, presence: true, length: { is: 2 }, uniqueness: true, format: { with: /\A[A-Z]{2}\z/, message: "must be a 2 letter province code" }
    validates :gst, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
    validates :pst, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }

    def self.ransackable_attributes(auth_object = nil)
        ["id", "name", "code", "gst", "pst", "created_at", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["addresses"]
    end
end
