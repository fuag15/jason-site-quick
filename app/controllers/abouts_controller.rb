# Controller for Project Pages, only admins can edit or create them
# See Project for more info on model
# does standard crud actions
class AboutsController < ApplicationController
  load_and_authorize_resource
  respond_to :html

  # simple create method on true sends a good notice
  def create
    flash[:notice] = 'About Created' if @about.save
    respond_with @about
  end

  # simple update method on success sends a good method
  def update
    flash[:notice] = 'About Successfully update' if @about.update_attributes! params[:about]
    respond_with @about
  end

  # almost default destroy, on success sends a good message
  def destroy
    flash[:notice] = 'About Successfully Deleted' if @about.destroy
    respond_with @about
  end
end
