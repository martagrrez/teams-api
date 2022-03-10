class Team < ApplicationRecord
  include TeamRepresentations

  has_many :players, dependent: :destroy
end
