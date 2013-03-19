# this controller handles images for both Article and Project
# otherwise it is standard crud
class ImagesController < ApplicationController
  load_and_authorize_resource
  respond_to :html
  before_filter :load_owner
  
  def create
    respond_with @image do |format|
      if @image.save
        flash[:notice] = 'Image Created'
        format.html { redirect_to [@owner, @image] }
      else
        flash[:error] = @image.error

        format.html do
          if params[:project_id].blank?
            redirect_to new_article_image_path @owner
          else
            redirect_to new_project_image_path @owner
          end
        end
      end
    end
  end

  def update
    respond_with @image do |format|
      if @image.update_attributes! params[:image]
        flash[:notice] = 'Image Succesfully updated'
        format.html { redirect_to [@owner, @image] }
      else
        flash[:error] = image.error

        format.html do
          if params[:project_id].blank?
            redirect_to edit_article_image_path @owner, @image
          else
            redirect_to edit_project_image_path @owner, @image
          end
        end
      end
    end
  end

  def show
    respond_with @image do |format|
      if @image.blank?
        flash[:error] = 'Image not found'

        format.html do
          if params[:project_id].blank?
            redirect_to article_images_path @owner
          else
            redirect_to project_images_path @owner
          end
        end
      end
    end
  end

  def destroy
    respond_with @image do |format|
      if @image and @image.destroy
        flash[:notice] = 'Image Successfully Deleted'
        format.html do 
          if params[:project_id].blank?
            redirect_to article_images_path @owner
          else
            redirect_to project_images_path @owner
          end
        end
      else
        flash[:error] = 'Image not found'
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
