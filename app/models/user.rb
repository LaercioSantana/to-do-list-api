class User < ApplicationRecord
  has_many :todos, dependent: :destroy

  attr_accessor :full_name, :email, :password
  validates_presence_of :full_name, :email, :password
end
