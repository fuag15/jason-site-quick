# this controller handles Members for Project
# otherwise it is standard crud
class MembersController < ApplicationController
  load_and_authorize_resource
  respond_to :html
  before_filter :load_project, except: [:destroy, :show, :edit]

  # narrow down the members loaded
  def index
    @members = @project.memebers
  end

  # create and return to a smart path based on our parent
  def create
    flash[:notice] = 'Member Created' if @project.members << @member
    respond_with @project, @member
  end

  # update and return to a smart path based on our parent
  def update
    flash[:notice] = 'Member Successfully updated' if @member.update_attributes! params[:member]
    respond_with @project, @member
  end

  # destroy and return to our parents member index path
  def destroy
    flash[:notice] = 'Member Successfully Deleted' if @member.destroy
    respond_with @member.project, @member
  end

  protected
    # we need the Project for some routes
    def load_project
      local_params = params
      @project = Project.find local_params[:project_id]
    end
end