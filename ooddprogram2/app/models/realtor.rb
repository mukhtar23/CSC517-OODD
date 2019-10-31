class Realtor < ApplicationRecord
  has_many :houses
  belongs_to :user
  belongs_to :company

  def name
    return User.find(user_id).name
  end
end
