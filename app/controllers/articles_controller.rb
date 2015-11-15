class ArticlesController < ApplicationController
	
#adding in authentication, using rails built-in authentication, rather than devise this time
http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

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

	def destroy
  		@article = Article.find(params[:id])
 	 	@article.destroy
 
  		redirect_to articles_path
	end

private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
