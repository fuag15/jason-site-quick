# Controller for Blog Posts, only admins can edit or create them
# See Article for more info on model
# does standard crud actions
class ArticlesController < ApplicationController
  load_and_authorize_resource
  respond_to :html
  
  def index
    @articles = Article.all
    respond_with @articles
  end

  def new
    @article = Article.new
    respond_with @article
  end

  def create
    article = Article.new params[:article]
    respond_with(article) do |format|
      if article.save
        flash[:notice] = 'Article Created'
        format.html { redirect_to article }
      else
        flash[:error] = article.error
        format.html { redirect_to new_article_path }
      end
    end
  end

  def edit
    @article = Article.find params[:id]
    respond_with @article
  end

  def update
    @article = Article.find params[:id]
    respond_with(@article) do |format|
      if @article.update_attributes! params[:article]
        flash[:notice] = 'Article Succesfully updated'
        format.html { redirect_to @article }
      else
        flash[:error] = article.error
        format.html { redirect_to edit_article_path(article) }
      end
    end
  end

  def show
    @article = Article.find params[:id]
    respond_with @article do |format|
      if @article.blank?
        flash[:error] = 'Article not found'
        format.html { redirect_to articles_path }
      end
    end
  end

  def destroy
    article = Article.find params[:id]
    respond_with @article do |format|
      if article and article.destroy
        flash[:notice] = 'Article Successfully Deleted'
        format.html { redirect_to articles_path }
      else
        flash[:error] = 'Article not found'
      end
    end
  end
end