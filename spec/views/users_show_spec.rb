require_relative '../rails_helper.rb'

RSpec.describe "Users", type: :system do
  #Create some test users and their associated data
  before do
    @user1 = User.create(name: 'Christian Momo', photo: 'https://placehold.co/200x200', bio: "Hello, I'm Christian Momo", posts_counter: 5)
    @user2 = User.create(name: 'Mael Momo', photo: 'https://placehold.co/200x200', bio: "Hello, I'm Mael Momo")
    @post1 = @user1.posts.create(title: "Post 1", text: "Lorem ipsum")
    @post2 = @user1.posts.create(title: "Post 2", text: "Dolor sit amet")
    @comment = Comment.create(text: 'comment 1', author: @user2, post: @post1)
  end

  it 'displays user information on the show page' do
    visit user_path(id: @user1.id)
    sleep(5)

    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user1.bio)
    expect(page).to have_selector("img[src='#{@user1.photo}']")
    expect(page).to have_content("Number of posts: 2") #user1 has 2 posts
    expect(page).to have_content(@post1.title)
    expect(page).to have_content(@post1.text)
    expect(page).to have_content(@post2.title)
    expect(page).to have_content(@post2.text)
  end

  it "redirects to post's index page when cliked" do
    visit user_path(id: @user1.id)
    
    find("a[id='see-all-posts']").click
    sleep(5)
    current_path
    expect(current_path).to eq(user_posts_path(user_id: @user1.id))
    expect(page).to have_content(@user1.name)
    expect(page).to have_selector("img[src='#{@user1.photo}']")
    expect(page).to have_content("Number of posts: 2")
    expect(page).to have_content(@post1.title)
    expect(page).to have_content(@post1.text)
    expect(page).to have_content(@post2.title)
    expect(page).to have_content(@post2.text)
    expect(page).to have_content("Comments: 1") #post1 has 1 comment from user2
    expect(page).to have_content("Likes: 0")
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@comment.text)

  end

end