require 'rails_helper'
require 'securerandom'

describe Post, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  subject {
    Post.new(author: user, title: 'Hello', text: 'This is my first post')
  }

  before { subject.save }

  describe 'validations' do
    it 'should have title present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'should have title with a max length of 250' do
      subject.title = SecureRandom.hex(251)
      expect(subject).to_not be_valid
    end

    describe '#commentscounter' do
      it 'should have an interger commentscounter' do
        subject.commentscounter = '200'
        expect(subject).to_not be_valid
      end

      it 'should be greater than or equal to 0' do
        subject.commentscounter = -1
        expect(subject).to_not be_valid
      end
    end

    describe '#likescounter' do
      it 'should have an interger likescounter' do
        subject.likescounter = '200'
        expect(subject).to_not be_valid
      end

      it 'should be greater than or equal to 0' do
        subject.likescounter = -1
        expect(subject).to_not be_valid
      end
    end
  end

  # describe '#postscounter to be >= 0' do
  #   it 'should be greater than 0' do
  #     subject.postscounter = -1
  #     expect(subject).to_not be_valid
  #   end

  #   it 'should be equal to 0' do
  #     subject.postscounter = 0
  #     expect(subject).to be_valid
  #   end

  #   it 'should be greater than 0' do
  #     subject.postscounter = 3
  #     expect(subject).to be_valid
  #   end
  # end
end
