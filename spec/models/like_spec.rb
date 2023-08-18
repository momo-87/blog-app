require_relative '../rails_helper.rb'

RSpec.describe Like, type: :model do
  describe 'callbacks' do
    let(:user) { User.create(name: 'Christian Momo', photo: nil, bio: nil, posts_counter: 0) }
    let(:post) { user.posts.create(title: 'Post 1', text: 'Hello', comments_counter: 0, likes_counter: 0) } 
    let(:like) { Like.new(author: user, post: post) }

    it 'updates the comments counter for a post after saving' do
      expect {
        like.save
      }.to change { post.reload.likes_counter }.by(1)
    end
  end
end