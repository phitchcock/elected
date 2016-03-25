require "administrate/base_dashboard"

class OfficialDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    city: Field::BelongsTo,
    staff_members: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    image: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    bio: Field::Text,
    street: Field::String,
    city_code: Field::String,
    state: Field::String,
    zip: Field::String,
    phone: Field::String,
    fax: Field::String,
    email: Field::String,
    facebook: Field::String,
    title: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :city,
    :staff_members,
    :id,
    :name,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :city,
    :staff_members,
    :id,
    :name,
    :image,
    :created_at,
    :updated_at,
    :bio,
    :street,
    :city_code,
    :state,
    :zip,
    :phone,
    :fax,
    :email,
    :facebook,
    :title,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :city,
    :staff_members,
    :name,
    :image,
    :bio,
    :street,
    :city_code,
    :state,
    :zip,
    :phone,
    :fax,
    :email,
    :facebook,
    :title,
  ]

  # Overwrite this method to customize how officials are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(official)
  #   "Official ##{official.id}"
  # end
end
