class BlogPost < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_blog_posts, through: :likes, source: :user


  has_many :favorites, dependent: :destroy
  has_many :favorited_blog_posts, through: :likes, source: :user

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

end
