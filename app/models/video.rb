# This model handles storage and ranking of Vimeo[http://vimeo.com] embeeded videos
# It belongs to either Article and Project
# [aspect]    The aspect ratio in Width / height stored as a float
# [name]      Quick Descriptor of video
# [rank]      The rating of this video, 0 is the highest
# [url]       The iframe url that is generated from vimeo
class Video < ActiveRecord::Base
  belongs_to :article
  belongs_to :project
  attr_accessible :aspect, :name, :rank, :url

  # extract vimeo information
  before_save :parse_vimeo

  # helper function to find out which model is our owner
  # returns a project instance if this is owned by a project
  # returns an article instance if this is owned by an article
  def owner
    self.project or self.article
  end

  # helper to generate iframe
  # this is for use in a redcarpet parser
  def iframe width=500, height=281
    "<iframe src='#{url}' width='#{width}' height='#{height}' frameborder='0' webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>"
  end

  private
    
    # parses vimeo iframes into correct model aspects for display
    def parse_vimeo
      # only if its as expected
      if url.match /iframe/
        # aspect = width / height
        self.aspect = url.match(/width=\"(\S*)\"/)[1].to_f / url.match(/height=\"(\S*)\"/)[1].to_f
        # set height to actual height
        self.url = url.match(/src=\"(\S*)\"/)[1]
      end
    end
end