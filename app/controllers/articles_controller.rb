class ArticlesController < ApplicationController
  def index
  	@articles = Article.all
  end

  def show
  	@article = Article.find(params[:id])
  end

  def new
  	@article = Article.new
  end

  def create
  	@article=Article.new(article_params)
  	if @article.save
  		flash[:notice] = 'New article has been created'
  		redirect_to articles_path
  	else
  		flash[:error] = "An error prevented adding this article"
  		render :new
  	end
  end

  def edit
  	@article = Article.find(params[:id])
  end

  def update
  	@article=Article.find(params[:id])
  	if @article.update(article_params)
  		redirect_to articles_path, notice: "Update Successful for #{@article.title}"
  	else
  		flash.now[:error] = 'An error occured that prevented the article from being updated.'
  		render :edit
  	end
  end

  def destroy
  	@article=Article.find(params[:id])
  	@article.destroy
  	redirect_to articles_path, notice: "Article deleted: #{@article.title}"
  end

private
	def article_params
		params.require(:article).permit(:author_first_name, :author_last_name, :title, :body, :article_pg, :pub_name, :article_year )
	end

end
