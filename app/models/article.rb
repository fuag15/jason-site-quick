# this class serves as our basic blog post it has two vals and a relationship
# [name]      The title of the blog post
# [content]   Catchall for raw html
# This class also has_many Image
class Article < ActiveRecord::Base
  default_scope order 'created_at desc'
  has_many :images, dependent: :destroy
  has_many :videos, dependent: :destroy
  attr_accessible :content, :name
end