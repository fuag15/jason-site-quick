# this controller handles images for both Article and Project
# otherwise it is standard crud
class ImagesController < ApplicationController
  load_and_authorize_resource
  respond_to :html
  before_filter :load_owner, exept: :destroy

  # create and return to a smart path based on our parent
  def create
    flash[:notice] = 'Image Created' if @image.save!
    respond_with @owner, @image
  end

  # update and return to a smart path based on our parent
  def update
    flash[:notice] = 'Image Successfully updated' if @image.update_attributes! params[:image]
    respond_with @image.owner, @image
  end

  # destroy and return to our parents image index path
  def destroy
    flash[:notice] = 'Image Successfully Deleted' if @image.destroy
    respond_with @image.owner, @image
  end

  protected
    # we need the parent for some routes
    # so here we do some introspection on how we were called
    # and set the right parent to Article or Project
    def load_owner
      local_params = params
      @owner = Article.find(local_params[:article_id]) or Project.find local_params[:project_id]
    end
end