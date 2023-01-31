require 'rails_helper'

describe 'GET user#index', type: :feature do
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

    visit users_path
  end

  describe 'View User names' do
    it 'displays names of all users' do
      @users.each do |user|
        expect(page).to have_content(user.name)
      end
    end
  end

  describe 'View Profile Photos' do
    it 'displays photos of all users' do
      @users.each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end
  end

  describe 'View User Posts Count' do
    it 'displays the number of posts for each user' do
      @users.each do |user|
        expect(page).to have_content("Number of posts: #{user.postscounter}")
      end
    end
  end

  describe 'GET user#show' do
    it "redirects to the user's show page" do
      first_user = @users.first
      within all('.user_info')[0] do
        click_link first_user.name
        expect(page).to have_current_path user_path(first_user)
      end
    end
  end
end
