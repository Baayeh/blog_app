require 'rails_helper'

RSpec.describe ' post#index', type: :feature do
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

    @comments = [
      Comment.create(
        post: first_post, 
        author: user, 
        text: 'Hi Tom!' )
    ]
  end

  describe 'User post index page' do
    it 'displays user\'s profile picture' do
      @users.each do |user|
        expect(page).to have_content(user.photo)
      end

      it 'has user\'s username' do
        @users.each do |user|
          expect(page).to have_content(user.name)
        end
      end

      it 'displays number of posts the user has written' do
        @posts.each do |post|
          expect(page).to have_content('Number of posts:', post.count)
        end
      end

      it 'has post\'s title' do
        @posts.each do |post|
          expect(page).to have_content(post.title)
        end
      end

      it 'displays post\'s body' do
        @posts.each do |post|
          expect(page).to have_content(post.text)
        end
      end
      

      it 'has first comments on a post' do
        @comments.each do |comment|
          expect(page).to have_content(posts.comment)
        end
      end

      it 'displays number of comments a post has' do
        @posts.each do |post|
          expect(page).to have_content(post.comments.count)
        end
      end

      it 'has a section pagination if there are more posts' do
        expect(page).to have_content('Pagination')
      end
    end

    it 'redirects to show page when a post is clicked' do

      visit user_posts_path

      click_link('See all posts')
    expect(page).to have_current_path(user_posts_path(user))
    end
  end
end