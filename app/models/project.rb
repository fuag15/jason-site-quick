# this model is to keep track fo a description, name, and members of each project
# can also have images
# [name]    Title of project
# [content] Description / blurb
#
# has_many Image
# has_many Member
# has_many Video
class Project < ActiveRecord::Base
  attr_accessible :content, :name

  has_many :images, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :videos, dependent: :destroy
end
