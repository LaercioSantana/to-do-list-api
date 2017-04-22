class User < ApplicationRecord
  has_many :todos, dependent: :destroy

  has_secure_password
  validates_presence_of :full_name, :email, :password
end
