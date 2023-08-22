require_relative '../rails_helper'

RSpec.describe PostsController, type: :request do
  let(:user) { User.create(name: 'Christian Momo', photo: nil, bio: nil, posts_counter: 0) }
  let(:post) { user.posts.create(title: 'Post 1', text: 'Hello', comments_counter: 0, likes_counter: 0) }

  describe 'GET #index' do
    it 'returns a successful response' do
      get "/users/#{user.id}/posts"
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get "/users/#{user.id}/posts"
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get "/users/#{user.id}/posts"
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include('Here are details for a given post')
    end
  end
end
