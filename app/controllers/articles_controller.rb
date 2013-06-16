# Controller for Blog Posts, only admins can edit or create them
# See Article for more info on model
# does standard crud actions
class ArticlesController < ApplicationController
  load_and_authorize_resource
  respond_to :html

  # overwrite index to paginate
  def index
    @articles = Article.page params[:page]
    respond_with @articles
  end

  # simple create method on true sends a good notice
  def create
    flash[:notice] = 'Article Created' if @article.save
    respond_with @article
  end

  # simple update method on success sends a good method
  def update
    flash[:notice] = 'Article Successfully update' if @article.update_attributes! params[:article]
    respond_with @article
  end

  # almost default destroy, on success sends a good message
  def destroy
    flash[:notice] = 'Article Successfully Deleted' if @article.destroy
    respond_with @article
  end
end
