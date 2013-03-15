class ArticlesController < ApplicationController
  responds_to [:html]

  def index
    @articles = Article.all
  end

  def new
  end

  def create
    article = Article.new params[:article]
    if article.save
      redirect_to show_article_path(article)
    else
      flash.errors = article.errors
      redirect_to new_article_path
    end
  end

  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]
    if @article.update_attributes! params[:article]
      redirect_to show_article_path(article)
    else
      flash.errors = article.errors
      redirect_to edit_article_path(article)
    end
  end

  def show
    @article = Article.find params[:id]
    if @article.blank?
      flash.errors = 'Article not found'
      redirect_to articles_path
    end
  end

  def destroy
    article = Article.find params[:id]
    if article and article.destroy!
      flash.notice = 'Article Successfully Deleted'
      redirect_to articles_path
    else
      flash.errors = 'Article not found'
    end
  end
end
