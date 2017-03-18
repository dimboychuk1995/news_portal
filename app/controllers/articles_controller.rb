class ArticlesController < ApplicationController
  before_action :set_search

  def index
    @articles = Article.all
    if params[:q].present?
      @articles = @search.result
    end

    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @articles = @articles.where(category: @category.id)
    end
    @articles = @articles.order(created_at: :desc).page(params[:page]).per(9)
  end

  def most_viewed
    @articles = Article.order('impressions_count DESC').page(params[:page]).per(9)
    render :index
  end

  def show
    @article = Article.find(params[:id])
    @latest_articles = Article.order(updated_at: :desc).first(5)
    impressionist(@article, '', unique: [:ip_address])
  end

  private

  def set_search
    @categories = Category.all
    @search = Article.ransack(params[:q])
  end
end
