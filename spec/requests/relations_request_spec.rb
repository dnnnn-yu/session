# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Relations', type: :request do
  describe 'GET /approve' do
    it 'returns http success' do
      get '/relations/approve'
      expect(response).to have_http_status(:success)
    end
  end
end
