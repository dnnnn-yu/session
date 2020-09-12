# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Talks', type: :request do
  describe 'GET /create_invitation' do
    it 'returns http success' do
      get '/talks/create_invitation'
      expect(response).to have_http_status(:success)
    end
  end
end
