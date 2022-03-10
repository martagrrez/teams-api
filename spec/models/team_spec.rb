require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'Relationships' do
    it { is_expected.to have_many(:players) }
  end
end
