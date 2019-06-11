class ArticlesController < ApplicationController
  def index
    @articles = Article.order(released_at: :desc)  # 降順
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to :action => "index", notice: "ニュースを登録しました。"
    else
      render "new"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to :articles
  end

  private

    def article_params
      params.require(:article).permit(:title, :body, :released_at, :expired_at, :member_only)
    end
end