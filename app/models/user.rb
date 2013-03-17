# this class holds our users, right now only one and only an admin
# usese devise junks for the rest along with cancan
# see Ability
class User < ActiveRecord::Base
  devise :database_authenticatable,
         :recoverable, :rememberable
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role

  # Simple function to test if our user is an admin
  # returns true if admin
  def admin?
    role == 'admin'
  end
end
