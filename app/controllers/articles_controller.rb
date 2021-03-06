class ArticlesController < ApplicationController
  # This will ruby that it needs to call the method set_article before it calls the other methods.
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def new
    @article = Article.new
  end

  def index
    @articles = Article.all
  end

  def destroy
    @article.destroy
    flash[:notice] = "Articles was successfully deleted."
    redirect_to articles_path
  end

  def show
  end

  def edit
  end

  def update
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
    @article.user = User.first
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

    def set_article
      @article = Article.find(params[:id])
    end


    def articles_params
      params.require(:article).permit(:title, :description)
    end
end