class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  # Allow only safe attributes to be searchable in ActiveAdmin
  def self.ransackable_attributes(auth_object = nil)
    ["id", "email", "created_at", "updated_at"]
  end
end
