class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
    if @article.update(articles_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def create
    # binding.pry
    # render plain: params[:article].inspect
    @article = Article.new(articles_params)
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to article_path(@article)
    else
        # you can do this render 'new' or this render :new
        render 'new'
    end
    # @article.save
    # redirect_to articles_path(@article)
  end
  private
    def articles_params
      params.require(:article).permit(:title, :description)
    end
end