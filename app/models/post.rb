class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250 }
  validates :commentscounter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likescounter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  after_create :increment_post_counter

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def increment_post_counter
    user.increment!(:postscounter)
  end

  private :increment_post_counter
end
