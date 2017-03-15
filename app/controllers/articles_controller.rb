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
    @articles = @articles.page(params[:page])
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
