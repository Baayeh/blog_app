class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true
  validates :postscounter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def most_recent_posts
    posts.first(3)
  end

  ROLES = %i[admin user].freeze

  def admin?
    role == :admin
  end
end
