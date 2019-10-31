class User < ApplicationRecord
  has_one :realtor, dependent: :destroy
  has_one :hunter, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  #validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }

  # has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :contact_method, allow_nil: true, inclusion: { in: [0, 1, 2, 3], message: "%{value} illegal. Legal values are: nil, 0, 1, 2,3 "}
  validates :role, allow_nil: true, inclusion: { in: [*0..3], message: "%{value} illegal. Legal values are: 0 to 3 "}
  #
  #   # Returns the hash digest of the given string.
  #   def User.digest(string)
  #     cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
  #                                                   BCrypt::Engine.cost
  #     BCrypt::Password.create(string, cost: cost)
  #   end

  def contact_method_output
    if contact_method == 0
        return 'email'
    else if contact_method ==1
           return 'phone'
         else
           if contact_method ==2
             return 'text'
           else
             return 'no preferred'
           end
         end
    end
  end

end
