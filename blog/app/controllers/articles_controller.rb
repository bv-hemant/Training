class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    get_task(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    get_task(params[:id])
  end

  def update
    @article = get_task(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end

    def get_task(id)
      @article = Article.find(id)
    end
end