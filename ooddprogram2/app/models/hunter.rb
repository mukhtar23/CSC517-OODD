class Hunter < ApplicationRecord
  has_many :inquiries, dependent: :destroy
  has_many :houses, :through => :inquiries
  has_many :interests, dependent: :destroy
  has_many :houses, :through => :interests
  belongs_to :user
end
