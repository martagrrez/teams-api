require 'rails_helper'

RSpec.describe 'Teams/ update', type: :controller do
  let!(:team) { create(:team) }
  let(:path) { team_path(team) }

  context 'when send update request' do
    it 'update team' do
      put path, params: {data: {name: 'new name'}}

      expect(response).to have_http_status(204)

      expect(team.reload.name).to eq('new name')
    end
  end
end
