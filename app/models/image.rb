class Image < ActiveRecord::Base
  belongs_to :article
  attr_accessible :file, :name, :project
end
