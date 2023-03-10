class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :increment_like_counter

  def increment_like_counter
    post.increment!(:likescounter)
  end

  private :increment_like_counter
end
