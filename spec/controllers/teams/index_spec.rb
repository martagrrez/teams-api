require 'rails_helper'

RSpec.describe 'Teams / index', type: :controller do
  let(:path) { teams_path }

  context 'when send index request' do
    before do
      create(:team)
    end

    get path

    expect(response).to have_http_status(200)
    expect(data.first).to eq(JSON.parse(Team.representation(:basic).to_json))
  end
end
