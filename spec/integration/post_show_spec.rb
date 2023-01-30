require 'rails_helper'

describe "GET posts#show", type: :feature do
  before(:each) do
    @users = [
      User.create(
        name: 'Tom',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Mexico.',
        postscounter: 2
      ),
      User.create(
        name: 'Lilly',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Poland.',
        postscounter: 5
      )
    ]

    @posts = [
      Post.create(
        author: @users.first,
        title: 'First Post',
        text: 'This is my first post'
      ),
      Post.create(
        author: @users.first,
        title: 'Second Post',
        text: 'This is my second post'
      )
    ]

    @comments = [
      Comment.create(
        post: @posts.first,
        author: @users.last,
        text: 'Hi Tom!'
      ),
      Comment.create(
        post: @posts.first,
        author: @users.last,
        text: 'Way to go! man'
      ),
    ]

    visit user_post_path(@users.first, @posts.first)
  end

  describe "Post Title" do
    it "should display the post title" do
      expect(page).to have_content @posts.first.title
    end
  end

end