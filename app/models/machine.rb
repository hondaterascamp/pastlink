class Machine < ApplicationRecord
  belongs_to :department
  belongs_to :product
  has_many :troubles
  validates :name, presence: true
end
