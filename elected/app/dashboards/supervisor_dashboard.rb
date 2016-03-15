require "administrate/base_dashboard"

class SupervisorDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    district: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    street: Field::String,
    city: Field::String,
    state: Field::String,
    zip: Field::String,
    email: Field::String,
    phone: Field::String,
    fax: Field::String,
    image: Field::String,
    bio: Field::Text,
    facebook: Field::String,
    twitter: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :district,
    :id,
    :name,
    :street,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :district,
    :id,
    :name,
    :street,
    :city,
    :state,
    :zip,
    :email,
    :phone,
    :fax,
    :image,
    :bio,
    :facebook,
    :twitter,
    :created_at,
    :updated_at,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :district,
    :name,
    :street,
    :city,
    :state,
    :zip,
    :email,
    :phone,
    :fax,
    :image,
    :bio,
    :facebook,
    :twitter,
  ]

  # Overwrite this method to customize how supervisors are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(supervisor)
  #   "Supervisor ##{supervisor.id}"
  # end
end
