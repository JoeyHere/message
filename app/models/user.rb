class User < ApplicationRecord
  has_many :messages
  validates :name, uniqueness: true
end
