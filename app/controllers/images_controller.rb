# this controller handles images for both Article and Project
# otherwise it is standard crud
class ImagesController < ApplicationController
  load_and_authorize_resource
  respond_to :html
  before_filter :load_owner
  def create
    respond_with @image do |format|
      if @image.save
        format.html { redirect_to [@owner, @image], notice: 'Image Created' }
      else
        format.html do
          redirect_to :back, error: @image.error
        end
      end
    end
  end

  def update
    respond_with @image do |format|
      if @image.update_attributes! params[:image]
        format.html { redirect_to [@owner, @image], notice: 'Image Successfully updated' }
      else
        format.html do
          redirect_to :back, error: @image.error
        end
      end
    end
  end

  def show
    respond_with @image do |format|
      if @image.blank?
        format.html do
          redirect_to :back, error: 'Image not found'
        end
      end
    end
  end

  def destroy
    respond_with @image do |format|
      if @image and @image.destroy
        format.html do
          flash[:notice] = 'Image Successfully Deleted'
          if params[:project_id].blank?
            redirect_to article_images_path @owner
          else
            redirect_to project_images_path @owner
          end
        end
      else
        format.html do
          redirect_to :back, error: 'Image not found'
        end
      end
    end
  end

  protected
    # we need the parent for some routes
    # so here we do some introspection on how we were called
    # and set the right parent to Article or Project
    def load_owner
      if params[:project_id].blank?
        @owner = Article.find params[:article_id]
      else
        @owner = Project.find params[:project_id]
      end
    end
end