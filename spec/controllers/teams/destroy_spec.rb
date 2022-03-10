require 'rails_helper'

RSpec.describe 'Teams / destroy', type: :controller do
  let!(:team) { create(:team) }
  let(:path) { team_path(team) }

  context 'when send destroy request' do
    it 'delete team' do
      expect { delete path }.to change(Team, :count).by(-1)

      expect(response).to have_http_status(204)
    end
  end
end
