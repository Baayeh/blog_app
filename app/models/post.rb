class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def most_recent_comments
    self.comments.order(created_at: :desc).limit(5)
  end
end
