require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'Relationships' do
    it { is_expected.to belong_to(:team) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:position) }
  end
end
