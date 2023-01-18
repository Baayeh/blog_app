require 'rails_helper'

describe User, type: :model do
  subject {
    User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  }

  before { subject.save }

  describe '#name' do
    it 'should have name present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  describe '#postscounter to be >= 0' do
    it 'should be greater than 0' do
      subject.postscounter = -1
      expect(subject).to_not be_valid
    end

    it 'should be equal to 0' do
      subject.postscounter = 0
      expect(subject).to be_valid
    end

    it 'should be greater than 0' do
      subject.postscounter = 3
      expect(subject).to be_valid
    end
  end
end