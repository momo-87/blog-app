require_relative '../rails_helper'

RSpec.describe 'Post', type: :system do
  # Create some test users and their associated data
  before do
    @user1 = User.create(name: 'Christian Momo', photo: 'https://placehold.co/200x200',
                         bio: "Hello, I'm Christian Momo", posts_counter: 5)
    @user2 = User.create(name: 'Mael Momo', photo: 'https://placehold.co/200x200', bio: "Hello, I'm Mael Momo")
    @post1 = @user1.posts.create(title: 'Post 1', text: 'Lorem ipsum')
    @comment = Comment.create(text: 'comment 1', author: @user2, post: @post1)
  end
  it 'displays post information on the User post show page' do
    visit user_post_path(user_id: @user1.id, id: @post1.id)
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@post1.title)
    expect(page).to have_content(@post1.text)
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@comment.text)
    expect(page).to have_content('Likes: 0')
    expect(page).to have_content('Comments: 1') # post1 has 1 comment from user2
  end
end
