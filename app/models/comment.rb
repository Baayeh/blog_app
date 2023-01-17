class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :increment_comment_counter

  def increment_comment_counter
    post.increment!(:commentscounter)
  end

  private :increment_comment_counter
end
