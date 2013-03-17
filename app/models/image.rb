# this is our image class for blog posts and projects, it has 3 attributes
# [file]    Where we will mount FileUploader
# [name]    A string designation for this picture
# 
# This record belongs_to Article
# This record belongs_to Project
class Image < ActiveRecord::Base
  belongs_to :article
  belongs_to :project
  attr_accessible :file, :name
end
