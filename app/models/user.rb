class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :blog_posts, dependent: :nullify
  has_many :comments, dependent: :nullify

  has_many :likes, dependent: :destroy
  has_many :liked_blog_post, through: :likes, source: :blog_post

  has_many :favorites, dependent: :destroy
  has_many :favorited_blog_post, through: :likes, source: :blog_post

end
