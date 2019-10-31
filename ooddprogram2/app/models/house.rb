class House < ApplicationRecord
  has_many :inquiries, dependent: :destroy
  has_many :hunters, :through => :inquiries
  has_many :interests, dependent: :destroy
  has_many :hunters, :through => :interests
  has_many_attached :images
  belongs_to :realtor
  belongs_to :company

  def style_output
    if style == 0
      return 'single family home'
    else if style ==1
           return 'apartment'
             else if style ==2
                    return 'condo'
                  else
                    return 'nil'
                  end
           end
    end
  end
end
