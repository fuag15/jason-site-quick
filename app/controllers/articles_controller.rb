# Controller for Blog Posts, only admins can edit or create them
# See Article for more info on model
# does standard crud actions
class ArticlesController < ApplicationController
  load_and_authorize_resource
  respond_to :html

  def create
    flash[:notice] = 'Article Created' if @article.save
    respond_with @article
  end

  def update
    flash[:notice] = 'Article Successfully update' if @article.update_attributes! params[:article]
    respond_with @article
  end

  def destroy
    flash[:notice] = 'Article Successfully Deleted' if @article.destroy
    respond_with @article
  end
end
