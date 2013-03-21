module ApplicationHelper  
  # helper class to return the right bootstrap display class for rails flash types
  def bootstrap_class_for flash_type
    case flash_type
      when :success
        'alert-success'
      when :error
        'alert-error'
      when :alert
        'alert-block'
      when :notice
        'alert-info'
      else
        flash_type.to_s
    end
  end

  # helper that generate a class of 'active' if the current route is the current pages route
  # you can pass just a controller and it will return active for if we are in the controller
  # or a controller and action combo in which case it will test against a narrower scope
  # used in our _navigation.haml partial
  def nav_class controller_needed, action_needed=nil
    if controller_name == controller_needed
      if action_needed
        if action_name == action_needed
          'active'
        end
      else
        'active'
      end
    end
  end
end
