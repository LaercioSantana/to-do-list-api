class User < ApplicationRecord
  has_many :todos, dependent: :destroy

  validates_presence_of :full_name, :email, :password
end
