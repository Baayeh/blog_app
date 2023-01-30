require 'rails_helper'

describe "GET user#index", type: :feature do
  before (:each) do
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

    visit users_path
  end

  describe "View User names" do
    it "display names of all users" do
      @users.each do |user|
        expect(page).to have_content(user.name)
      end
    end
  end

  describe "View Profile Photos" do
    it "display photos of all users" do
      @users.each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end
  end

end