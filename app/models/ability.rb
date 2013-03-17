# This class controls who can or can not manage models or read which routes
# on a failure it throws a CanCan::Access Denied which is handled by the ApplicationController
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
        can :manage, :all
    else
        can :read, :all
    end
  end
end
