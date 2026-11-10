class Trouble < ApplicationRecord
  attr_accessor :machine_name
  belongs_to :machine
  belongs_to :product
  belongs_to :user
  has_one_attached :photo

  enum :status, { 未対応: 0, 対応中: 1, 完了: 2 }

  validates :content, :stopped_at, presence: true
  validates :action, presence: true, if: :完了?
end
