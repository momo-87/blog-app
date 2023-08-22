require_relative '../rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get '/users'
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get '/users'
      expect(response.body).to include('Here is a the list of all users')
    end
  end

  describe 'GET #show' do
    let(:user) { User.create(name: 'Christian Momo', photo: nil, bio: nil, posts_counter: 0) }

    it 'returns a successful response' do
      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get "/users/#{user.id}"
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get "/users/#{user.id}"
      expect(response.body).to include('Here are details for a given user')
    end
  end
end
