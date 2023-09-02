require 'swagger_helper'

describe 'API::Comments', type: :request do
  path '/api/users/{user_id}/posts/{post_id}/comments' do
    parameter name: 'user_id', in: :path, type: :integer, required: true
    parameter name: 'post_id', in: :path, type: :integer, required: true
    parameter name: :comment, in: :body, schema: {
      type: :object,
      properties: {
        text: { type: :string }
      },
      required: ['text']
    }

    post 'Creates a comment' do
      tags 'Comments'
      consumes 'application/json'
      produces 'application/json'
      security [Bearer: []]

      let(:user) { create(:user) }
      let(:post) { create(:post) }
      let(:user_id) { user.id }
      let(:post_id) { post.id }
      let(:comment) { { text: 'This is a new comment' } }

      response '201', 'comment created' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            text: { type: :string },
            created_at: { type: :string, format: 'date-time' },
            updated_at: { type: :string, format: 'date-time' }
          },
          required: ['id', 'text', 'created_at', 'updated_at']

        run_test! do
          expect(JSON.parse(response.body)).to include('id', 'text', 'created_at', 'updated_at')
          expect(response).to have_http_status(201)
        end
      end

      response '422', 'unprocessable entity' do
        let(:comment) { { text: '' } }

        schema type: :object,
          properties: {
            errors: {
              type: :array,
              items: {
                type: :string
              }
            }
          },
          required: ['errors']

        run_test! do
          expect(JSON.parse(response.body)).to include('errors')
          expect(response).to have_http_status(422)
        end
      end
    end
  end
end