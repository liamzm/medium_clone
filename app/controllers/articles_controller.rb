class ArticlesController < ApplicationController

	before_action only: [:new, :vote]
	before_action :set_article, only: [:show, :vote]

	respond_to :js, :json, :html




	def index

		@articles = Article.order(created_at: :desc)

	end

	def new
		@article = Article.new

	end

	def update
		
	end


	def vote 

		# byebug
		if !current_user.liked? @article
			@article.liked_by current_user
		elsif current_user.liked? @article
			@article.unliked_by current_user
		end

		respond_to do |format|
  			format.js {render :layout=>false}
		end

	end


	

	def create

		@article = Article.new(article_params)
		@article.user_id = current_user.id

		if @article.save
			redirect_to @article

		else
			redirect_to new_article_path

	end
end

	def show 

		@article = Article.find(params[:id])

		@comment = Comment.new

		@author = User.find(@article.user_id)

		@find_comments = Comment.where(article_id: params[:id])

		@comments = @find_comments.order(id: :desc)


	end

	def edit 

		@article = Article.find(params[:id])

	end

	def update

		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to article_path(@article)
		else
			render "edit"
		end
	end



	private
	
	def article_params
		params.require(:article).permit(:title, :subhead, :content, :user_id)
	end

	def set_article
		@article = Article.find(params[:id])
	end
end
