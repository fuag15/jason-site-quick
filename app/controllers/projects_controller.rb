# Controller for Project Pages, only admins can edit or create them
# See Project for more info on model
# does standard crud actions
class ProjectsController < ApplicationController
  load_and_authorize_resource
  respond_to :html

  # extract main video
  def index
    if @projects.present?
      @showcase_project = @projects.delete_at 0
    end
    render
  end

  # simple create method on true sends a good notice
  def create
    flash[:notice] = 'Project Created' if @project.save
    respond_with @project
  end

  # simple update method on success sends a good method
  def update
    flash[:notice] = 'Project Successfully update' if @project.update_attributes! params[:project]
    respond_with @project
  end

  # almost default destroy, on success sends a good message
  def destroy
    flash[:notice] = 'Project Successfully Deleted' if @project.destroy
    respond_with @project
  end
end
