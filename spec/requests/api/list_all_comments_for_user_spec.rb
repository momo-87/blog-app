require 'swagger_helper'

RSpec.describe 'Comments API', type: :request do
  path '/users/{user_id}/posts/{post_id}/comments' do
    parameter name: 'user_id', in: :path, type: :integer, required: true
    parameter name: 'post_id', in: :path, type: :integer, required: true

    get 'List all comments for a user\'s post' do
      tags 'Comments'
      produces 'application/json'

      let(:user) { create(:user) }
      let(:post) { user.posts.create(title: 'Test Post', text: 'Test text') }
      let(:user_id) { user.id }
      let(:post_id) { post.id }

      response '200', 'list of comments' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   text: { type: :string },
                   created_at: { type: :string, format: 'date-time' },
                   updated_at: { type: :string, format: 'date-time' }
                 },
                 required: %w[id text created_at updated_at]
               }

        run_test! do
          expect(response).to have_http_status(200)
          comments = JSON.parse(response.body)
          expect(comments).to be_an(Array)
        end
      end
    end
  end
end
