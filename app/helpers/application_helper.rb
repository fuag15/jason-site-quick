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
end