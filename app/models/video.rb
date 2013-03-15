class Video < ActiveRecord::Base
  belongs_to :article
  belongs_to :project
  attr_accessible :aspect, :name, :rank, :url
end
