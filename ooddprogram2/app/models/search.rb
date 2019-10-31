class Search < ApplicationRecord

  def house_search
    houses = House.all
    # where(["location LIKE ?", " %#{location}%"])  if self.location.present?
     houses = houses.where("lower(location) like ?", "%#{location.downcase}%")  if location.present?
     houses=houses.where("price >= ?", min_price) if min_price.present?
     houses=houses.where("price<= ?", max_price) if max_price.present?
     houses=houses.where("square_ft >= ?", min_footage) if min_footage.present?
    houses=houses.where( "square_ft <= ?", max_footage) if max_footage.present?

    houses
  end
end
