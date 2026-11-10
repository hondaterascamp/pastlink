class Product < ApplicationRecord
  belongs_to :department
  has_many :machines, dependent: :destroy
  has_many :troubles
  validates :name, presence: true
end
