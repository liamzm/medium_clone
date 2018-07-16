class CommentsController < ApplicationController








	# def upvote
		
	# 	@comment = Comment.find(params[:comment_id])
	# 	@upvote_count = @comment.upvotes

	# 	@comment.update(upvotes: (@upvote_count + 1))


	# 	respond_to do |format|
		
	# 		format.html { redirect_back }
	# 		format.js 

	# 	end

	# end





	def create


		@comment = current_user.comments.new(comment_params)
		@comment.article_id = params[:article_id]
		@article = Article.find(params[:article_id])

		if @comment.save
			redirect_to article_path(params[:article_id])
		else
			redirect_to article_path(params[:article_id])
		end


	end




	private

	def comment_params

		params.require(:comment).permit(:content)

	end


end
