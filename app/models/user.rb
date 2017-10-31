class User < ApplicationRecord
  has_secure_password
  validates :full_name, :password, :email, presence: true
  validates :email, uniqueness: true
end
