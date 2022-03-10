class Player < ApplicationRecord
  include PlayerRepresentations
  include Filterable

  scope :team_id_filter, ->(team_id) { where(team_id:) }
  scope :position_filter, ->(position) { where(position:) }

  # enum position definido en SQL: [goalkeeper, defender, midfielder, forward]

  belongs_to :team

  validates :position, presence: true
end
