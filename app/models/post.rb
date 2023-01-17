class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments
  
  after_create :increment_post_counter

  def most_recent_comments
    self.comments.order(created_at: :desc).limit(5)
  end

  def increment_post_counter
    user.increment!(:postscounter)
  end

  private :increment_post_counter
  
end
