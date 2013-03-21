# Controller for Blog Posts, only admins can edit or create them
# See Article for more info on model
# does standard crud actions
class ArticlesController < ApplicationController
  load_and_authorize_resource
  respond_to :html

  def create
    respond_with @article do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article Created' }
      else
        format.html { redirect_to new_article_path, error: @article.error }
      end
    end
  end

  def update
    respond_with @article do |format|
      if @article.update_attributes! params[:article]
        format.html { redirect_to @article, notice: 'Article Successfully updated' }
      else
        format.html { redirect_to edit_article_path @article, error: @article.error }
      end
    end
  end

  def show
    respond_with @article do |format|
      if @article.blank?
        format.html { redirect_to articles_path, error: 'Article not found' }
      end
    end
  end

  def destroy
    respond_with @article do |format|
      if @article and @article.destroy
        format.html { redirect_to articles_path, notice: 'Article Successfully Deleted' }
      else
        format.html { redirect_to articles_path, error: 'Article not found' }
      end
    end
  end
end
