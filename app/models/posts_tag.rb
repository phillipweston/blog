class PostsTag < ActiveRecord::Base
	belongs_to :post
	belongs_to :tag

	validates :post_id, :presence => true
  validates :tag_id, :presence => true
	
  # Remember to create a migration!
end
