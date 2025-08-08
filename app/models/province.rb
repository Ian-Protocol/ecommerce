class Province < ApplicationRecord
    has_many :addresses

    def self.ransackable_attributes(auth_object = nil)
        ["id", "name", "code", "gst", "pst", "created_at", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["addresses"]
    end
end
