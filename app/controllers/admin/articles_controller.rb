class Admin::ArticlesController < Admin::BaseController
  before_action :set_article, only: [:create, :show, :edit, :update, :destroy, :upload_attachment]
  before_action :set_categories, only: [:new, :create, :edit, :update]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.create(title: "#{t(:new_article_form)} #{Date.current}", content: '', category: Category.first)
    redirect_to edit_admin_article_url(@article)
  end

  def edit
  end

  def create
    if @article.update(article_params)
      redirect_to edit_admin_article_url(@article), notice: t(:article_was_successfully_created)
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to edit_admin_article_url(@article), notice: t(:article_was_successfully_updated)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_url, notice: t(:article_was_successfully_destroyed)
  end

  def upload_attachment
    @attachment = @article.attachments.create(image: params[:file])
    respond_to do |format|
      format.json { render :json => { status: 'OK', link: @attachment.image.url}}
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end

  def article_params
    params.require(:article).permit(:title, :content, :category_id, :main_image)
  end
end
