json.extract! house, :id, :location, :square_ft, :year_built, :style, :price, :floor, :basement, :owner, :contact_info, :realtor_id, :company_id, :pic_link, :created_at, :updated_at
json.url house_url(house, format: :json)
