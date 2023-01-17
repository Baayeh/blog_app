class User < ApplicationRecord
  has_many :posts, :likes, :comments
end
