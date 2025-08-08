  class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :orders
  has_many :addresses
  has_one :cart

  def self.ransackable_attributes(auth_object = nil)
    ["id", "email", "created_at", "updated_at", "admin", "reset_password_token"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["orders", "addresses", "cart"]
  end
end
