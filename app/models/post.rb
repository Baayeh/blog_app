class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments
  after_create :increment_comment_count

  def most_recent_comments
    self.comments.order(created_at: :desc).limit(5)
  end

  def increment_comment_count
    self.increment!(:commentscounter)
  end

end
