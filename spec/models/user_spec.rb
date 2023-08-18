require_relative '../rails_helper.rb'

RSpec.describe User, type: :model do
  let(:user) { described_class.new(name: 'Christian Momo', photo: nil, bio: nil, posts_counter: 5) }

  before { user.save }

  describe 'validations' do
    it 'requires name to be present' do
      user.name = nil
      expect(user).not_to be_valid
    end

    it 'requires posts_counter to be a positive integer' do
      user.posts_counter = -1
      expect(user).not_to be_valid
    end
  end

  describe '#three_most_recent_posts' do
    before do
      @post1 = user.posts.create(title: 'Post 1', text: 'Hello', comments_counter: 0, likes_counter: 0)
      @post2 =  user.posts.create(title: 'Post 2', text: 'Hello', comments_counter: 0, likes_counter: 0)
      @post3 =  user.posts.create(title: 'Post 3', text: 'Hello', comments_counter: 0, likes_counter: 0)
      @post4 =  user.posts.create(title: 'Post 4', text: 'Hello', comments_counter: 0, likes_counter: 0)
    end

    it 'returns the three most recent posts for a given user' do
      most_recent_posts = user.three_most_recent_posts
      expect(most_recent_posts).to eq([@post4, @post3, @post2])
    end

    it 'returns an empty array if the user has no posts' do
      user.posts.destroy_all
      most_recent_posts = user.three_most_recent_posts
      expect(most_recent_posts).to be_empty
    end
  end
end