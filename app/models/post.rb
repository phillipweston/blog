class Post < ActiveRecord::Base
	has_many :posts_tags
	has_many :tags, :through => :posts_tags
	
	validates :body, :presence => true
  validates :title, :presence => true
  # Remember to create a migration!
end
