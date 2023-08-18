require_relative '../rails_helper'

RSpec.describe Comment, type: :model do
  describe 'callbacks' do
    let(:user) { User.create(name: 'Christian Momo', photo: nil, bio: nil, posts_counter: 0) }
    let(:post) { user.posts.create(title: 'Post 1', text: 'Hello', comments_counter: 0, likes_counter: 0) }
    let(:comment) { Comment.new(text: 'Great post!', author: user, post:) }

    it 'updates the comments counter for a post after saving' do
      expect do
        comment.save
      end.to change { post.reload.comments_counter }.by(1)
    end
  end
end
