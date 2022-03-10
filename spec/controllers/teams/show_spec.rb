require 'rails_helper'

RSpec.describe 'Team / show', type: :controller do
  let(:path) { team_path(Seed.company_team.id) }

  context 'when user is logged and authorized' do
    get path

    expect(response).to have_http_status(200)
  end
end
