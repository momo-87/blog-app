require 'swagger_helper'

RSpec.describe 'Posts API', type: :request do
  path '/users/{user_id}/posts' do
    parameter name: 'user_id', in: :path, type: :integer, required: true

    get 'List all posts for a user' do
      tags 'Posts'
      produces 'application/json'

      let(:user) { create(:user) }
      let!(:posts) { create_list(:post, 3, user:) }
      let(:user_id) { user.id }

      response '200', 'list of posts' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   title: { type: :string },
                   text: { type: :string },
                   created_at: { type: :string, format: 'date-time' },
                   updated_at: { type: :string, format: 'date-time' }
                 },
                 required: %w[id title text created_at updated_at]
               }

        run_test! do
          expect(response).to have_http_status(200)
          posts = JSON.parse(response.body)
          expect(posts).to be_an(Array)
        end
      end
    end
  end
end
