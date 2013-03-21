# This class is used to associate members of projects
# they give their real life name and get associated to what 
# project they worked on with midgard productions
#
# [name]  Real World Name
#
# belongs_to Project
class Member < ActiveRecord::Base
  belongs_to :project
  attr_accessible :name
end