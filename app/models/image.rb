# this is our image class for blog posts and projects, it has 3 attributes
# [file]    Where we will mount ImageUploader
# [name]    A string designation for this picture
# This record belongs_to Article
# This record belongs_to Project
class Image < ActiveRecord::Base
  mount_uploader :file, ImageUploader
  belongs_to :article
  belongs_to :project
  belongs_to :about
  attr_accessible :file, :name

  # helper function to find out which model is our owner
  # returns a project instance if this is owned by a project
  # returns an article instance if this is owned by an article
  def owner
    self.project or self.article
  end
end