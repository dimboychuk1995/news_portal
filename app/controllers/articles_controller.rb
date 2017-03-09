class ArticlesController < ApplicationController
  def index
    @search = Article.ransack(params[:q])
    @articles = Article.all
    if params[:q].present?
      @articles = @search.result
    end
    @articles = @articles.where(category: Category.find(params[:category_id])) if params[:category_id].present?
    @articles = @articles.page(params[:page]).per(1)
  end

  def show
    @search = Article.ransack(params[:q])
    @article = Article.find(params[:id])
  end
end
