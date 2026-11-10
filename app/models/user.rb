class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :troubles
  belongs_to :department, optional: true

  validates :employee_number, presence: true, uniqueness: true
end
