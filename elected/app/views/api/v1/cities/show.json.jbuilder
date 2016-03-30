json.city(@city)

json.officials(@city.officials)



json.officials @officials do |official|
  json.(official, :id, :name, :title, :image, :city_id, :bio, :street, :city_code, :state, :zip, :phone, :fax, :email, :facebook)

  json.staff_members official.staff_members do |staff_member|
    json.(staff_member, :id, :official_id, :name, :email)
  end
end


json.official(@official, :id, :name, :title, :image,
                        :city_id, :bio, :street, :city_code, :state, :zip, :phone,
                        :fax, :email, :facebook, :staff_members)
