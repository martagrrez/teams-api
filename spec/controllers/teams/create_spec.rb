require 'rails_helper'

RSpec.describe 'Teams / create', type: :controller do
  let!(:attributes_for_create) { {name: 'name'} }
  let(:path) { teams_path }

  context 'when send create request' do
    it 'create team' do
      post path, params: {data: attributes_for_create}

      expect(response).to have_http_status(201)
    end
  end
end
