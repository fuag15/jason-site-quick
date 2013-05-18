# this controller handles videos for both Article and Project
# otherwise it is standard crud
class VideosController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :json
  before_filter :load_owner, except: [:destroy, :show, :edit]

  # narrow our loaded videos down
  def index
    @videos = @owner.videos
    respond_with @videos
  end

  def show
    respond_with @video
  end

  # create and return to a smart path based on our parent
  def create
    flash[:notice] = 'Video Created' if @owner.videos << @video
    respond_with @owner, @video
  end

  # update and return to a smart path based on our parent
  def update
    flash[:notice] = 'Video Successfully updated' if @video.update_attributes! params[:video]
    respond_with @owner, @video
  end

  # destroy and return to our parents video index path
  def destroy
    flash[:notice] = 'Video Successfully Deleted' if @video.destroy
    respond_with @video.owner, @video
  end

  protected
    # we need the parent for some routes
    # so here we do some introspection on how we were called
    # and set the right parent to Article or Project
    def load_owner
      local_params = params
      if local_params[:article_id]
        @owner = Article.find local_params[:article_id]
      else
        @owner = Project.find local_params[:project_id]
      end
    end
end