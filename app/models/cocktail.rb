class Cocktail < ApplicationRecord

  validates :name, presence: true, uniqueness: true

  include PgSearch::Model
  pg_search_scope :search_by_name,
                  against: :name,
                  using: {
                    tsearch: {normalization: 2, prefix: true}
                  }

end
