class Comment < ActiveRecord::Base
  belongs_to :blog_post
  belongs_to :user

  validates :body, presence: true
end
