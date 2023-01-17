class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments
  after_create :increment_post_count

  def most_recent_posts
    self.posts.order(created_at: :desc).limit(3)
  end

  def increment_post_count
    self.increment!(:postscounter)
  end

end
