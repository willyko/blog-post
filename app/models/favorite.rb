class Favorite < ActiveRecord::Base
  belongs_to :blog_post
  belongs_to :user

  validates :user_id, uniqueness: {scope: :blog_post_id}
end
