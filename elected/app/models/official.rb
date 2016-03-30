class Official < ActiveRecord::Base
  belongs_to :city
  has_many :staff_members

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :sorted_by,
      :search_query
    ]
  )

  scope :search_query, lambda { |query|
    return nil if query.blank?

    terms = query.downcase.split(/\s+/)

    terms = terms.map { |e|
      (e.gsub('', '%') + '%').gsub(/%+/, '%')
    }

    num_or_conds = 1

    byebug
    clause = terms.map { |term|
      "(LOWER(officials.name) LIKE ?)"
    }.join(' AND '),
    *terms.map { |e| [e] * num_or_conds }.flatten

    where(clause)
  }

  scope :sorted_by, lambda { |sort_key|
  }
end
