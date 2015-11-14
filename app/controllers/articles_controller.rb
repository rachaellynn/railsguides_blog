class ArticlesController < ApplicationController
	def index
    @articles = Article.all
  	end

	def new
	@article = Article.new
	end

	def edit
  	@article = Article.find(params[:id])
	end

	def create
	#render plain: params[:article].inspect
	@article = Article.new(article_params)

	 	if @article.save
	    redirect_to @article
	  	else
	  	#render here brings back any info that was filled in, rather than issuing a new request and losing data
	    render 'new'
	  	end
	end

	def show
    @article = Article.find(params[:id])
  	end

  	def update
  	@article = Article.find(params[:id])
 
  		if @article.update(article_params)
    		redirect_to @article
  		else
    	render 'edit'
  		end
	end

private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
