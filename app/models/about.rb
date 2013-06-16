class About < ActiveRecord::Base
  attr_accessible :content
  has_many :images, dependent: :destroy
end
