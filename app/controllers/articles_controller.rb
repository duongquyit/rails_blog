class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  # [GET] /articles
  def index
    @articles = Article.all
  end

  # [GET] /articles/:id
  def show
    @article = Article.find(params[:id])
  end

  # [GET] /articles/new 
  def new
    @article = Article.new
  end

  # [POST] /articles
  def create
    @article = Article.new(article_param)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  # [GET] /articles/:id/edit
  def edit
    @article = Article.find(params[:id])
  end

  # [PATCH/PUT] /articles/:id
  def update
    @article = Article.find(params[:id])
    if @article.update(article_param)
      redirect_to @article
    else
      render 'edit'
    end
  end

  # [DELETE] /articles/:id
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
    redirect_to articles_path
  end

  private
    def article_param
      params.require(:article).permit(:title, :text)
    end
end
