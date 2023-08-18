require_relative '../rails_helper.rb'

RSpec.describe Post, type: :model do
  let(:user) { User.new(name: 'Christian Momo', photo: nil, bio: nil, posts_counter: 0) }
  let(:post) { user.posts.create(title: 'Post 1', text: 'Hello', comments_counter: 0, likes_counter: 0) } 
  
  before { user.save }

  describe 'validation' do
    
    it 'requires title to be present' do
      post.title = nil
      expect(post).not_to be_valid
    end

    it 'requires comments_counter to be a positive integer' do
      post.comments_counter = -1
      expect(post).not_to be_valid
    end

    it 'requires likes_counter to be a positive integer' do
      post.comments_counter = -1
      expect(post).not_to be_valid
    end
  end

  describe '#five_most_recent_comments' do
    before do
      @comment1 = Comment.create(text: 'comment 1', author: user, post: post)
      @comment2 = Comment.create(text: 'comment 2', author: user, post: post)
      @comment3 = Comment.create(text: 'comment 3', author: user, post: post)
      @comment4 = Comment.create(text: 'comment 4', author: user, post: post)
      @comment5 = Comment.create(text: 'comment 5', author: user, post: post)
      @comment6 = Comment.create(text: 'comment 6', author: user, post: post)

    end
    it 'should return the five most recent comments for a given post' do
      most_recent_comments = post.five_most_recent_comments
      expect(most_recent_comments).to eq([@comment6, @comment5, @comment4, @comment3, @comment2])
    end
  end

  describe '#update_author_posts_count' do
    let(:post2) { user.posts.build(title: 'Post 2 ', text: 'Hi', comments_counter: 0, likes_counter: 0) }
    it 'Update the author posts_counter after saving' do
      expect {
        post2.save
      }.to change { user.reload.posts_counter }.by(1)
    end
  end

end