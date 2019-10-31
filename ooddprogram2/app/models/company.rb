class Company < ApplicationRecord
  has_many :realtors
  has_many :houses, dependent: :destroy
  validates :revenue, allow_nil: true, format: { with: /(^[0-9]*[-][0-9]+)|(^[0-9]*[\+]?)/}
  validates :size, allow_nil: true, format: { with: /(^[0-9]*[-][0-9]+)|(^[0-9]*[\+]?)/}
end
