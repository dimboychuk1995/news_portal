class ErrorsController < ApplicationController
  before_action :set_search

  def not_found
    render(:status => 404)
  end

  def internal_server_error
    render(:status => 500)
  end

  private

  def set_search
    @categories = Category.all
    @search = Article.published.ransack(params[:q])
  end
end
