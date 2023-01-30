require 'rails_helper'

RSpec.describe 'GET#show', type: :feature do
  before(:each) do
    @users = [
      User.create(
        name: 'Tom',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Mexico.'
      ),
      User.create(
        name: 'Lilly',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Poland.'
      )
    ]
    @posts = [
      Post.create(
        author: user, 
        title: 'Hello', 
        text: 'This is my first post'
      ),
      Post.create(
        author: user, 
        title: 'Hello', 
        text: 'This is my second post'
      ),
      Post.create(
        author: user, 
        title: 'Hello', 
        text: 'This is my third post'
      ),
    ]
  end
  describe 'User visits show page and sees user info' do
    visit user_path(user)

    it 'displays user\'s profile picture' do

      @users.each do |user|
        expect(page).to have_css('img[src="#{user.photo}"]')
      end
    end

    it 'shows user\'s username' do
      @users.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    it 'renders the number of user\'s posts' do
      @users.each do |user|
        expect(page).to have_content('Number of posts: #{user.posts.count}')
      end
    end

    it 'renders  user\'s bio' do
      @users.each do |user|
        expect(page).to have_content(user.bio)
      end
    end

    it 'renders the number of user\'s posts count' do
      @users.each do |user|
        expect(page).to have_selector('.post', count: 3)
      end
    end

    it 'dispays all user\'s posts' do
      @users.each do |user|
        expect(page).to have_link('See all posts', href: user_posts_path(user))
      end
    end
  end

  describe 'See all posts and user\'s post index page' do
  it 'renders and redirects to show page when user clicks on a post' do
    visit user_path(user)

    @posts.each do |post|

    expect(page).to have_content(post.title)

    expect(page).to have_current_path(post_path(post.first))

    click_link('See all posts')
    expect(page).to have_current_path(user_posts_path(user))
  end
  end
end