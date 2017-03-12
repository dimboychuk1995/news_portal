class ArticlesController < ApplicationController
  before_action :set_search

  def index
    @articles = Article.all
    if params[:q].present?
      @articles = @search.result
    end
    @articles = @articles.where(category: Category.find(params[:category_id])) if params[:category_id].present?
    @articles = @articles.page(params[:page]).per(1)
  end

  def most_viewed
    @articles = Article.order('impressions_count DESC').page(params[:page]).per(1)
    render :index
  end

  def show
    @article = Article.find(params[:id])
    impressionist(@article, '', unique: [:ip_address])

    puts @article.impressionist_count(filter: :ip_address)
  end

  private

  def set_search
    @search = Article.ransack(params[:q])
  end
end
