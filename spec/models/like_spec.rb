require 'rails_helper'

describe Like, type: :model do
  describe 'validations' do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')

    subject do
      Like.new(author: @user, post: @post)
    end

    before { subject.save }

    it { should belong_to(:author) }

    it { should belong_to(:post) }
  end
end
