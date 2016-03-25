require "administrate/base_dashboard"

class StaffMemberDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    official: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    email: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :official,
    :id,
    :name,
    :email,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :official,
    :id,
    :name,
    :email,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :official,
    :name,
    :email,
  ]

  # Overwrite this method to customize how staff members are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(staff_member)
  #   "StaffMember ##{staff_member.id}"
  # end
end
