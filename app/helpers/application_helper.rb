# class for heling all views in the application
# helps determine what route is active as well as
# what class is appropriate in bootstrap for a rails flash
module ApplicationHelper
  # helper class to return the right bootstrap display class for rails flash types
  def bootstrap_class_for flash_type
    case flash_type
      when :alert
        'alert-block'
      when :notice
        'alert-info'
      else
        "alert-#{flash_type}"
    end
  end

  # helper that generate a class of 'active' if the current route is the current pages route
  # you can pass just a controller and it will return active for if we are in the controller
  # or a controller and action combo in which case it will test against a narrower scope
  # used in our _navigation.haml partial
  def nav_class controller_needed, action_needed=nil
    'active' if controller_name == controller_needed and ( action_needed == action_name or action_needed.blank? )
  end

  # Set up a helper to render red carpet markdown for some posting items
  # uses redcarpet2
  def markdown text
    markdown = Redcarpet::Markdown.new HTMLWithVideos, autolink: true, space_after_headers: true, no_intra_emphasis: true, superscript: true
    return markdown.render(text).html_safe
  end

  # displays a video imframe link to vimeo, used by Video
  def iframe video, width=500, height=281
    "<iframe src='#{video.url}' width='#{width}' height='#{height}' frameborder='0' allowfullscreen webkitallowfullscreen></iframe>".html_safe
  end
end