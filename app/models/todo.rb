class Todo < ApplicationRecord
  belongs_to :user

  attr_accessor :done, :description, :priority
  validates_presence_of :description
end
