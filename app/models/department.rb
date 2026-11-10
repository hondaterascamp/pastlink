class Department < ApplicationRecord
  has_many :users
  has_many :products, dependent: :destroy
  has_many :machines
  validates :name, presence: true, uniqueness: true
end
