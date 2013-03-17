# This model handles storage and ranking of Vimei[http://vimeo.com] embeeded videos
# It belongs to either Article and Project
# [aspect]    The aspect ratio in Width / height stored as a float
# [name]      Quick Descriptor of video
# [rank]      The rating of this video, 0 is the highest
# [url]       The iframe url that is generated from vimeo
class Video < ActiveRecord::Base
  belongs_to :article
  belongs_to :project
  attr_accessible :aspect, :name, :rank, :url
end
